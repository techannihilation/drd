--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
    return {
        name = "Dynamic Robot Defense Spawner",
        desc = "Spawn Robots",
        author = "TheFatController/quantum heavly modified by KING's",
        date = "27 October, 2017",
        license = "GNU GPL, v2 or later",
        layer = 0,
        enabled = true --  loaded by default?
    }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (gadgetHandler:IsSyncedCode()) then
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    -- BEGIN SYNCED
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Speed-ups
    --

    local ValidUnitID = Spring.ValidUnitID
    local GetUnitNeutral = Spring.GetUnitNeutral
    local GetTeamList = Spring.GetTeamList
    local GetTeamLuaAI = Spring.GetTeamLuaAI
    local GetGaiaTeamID = Spring.GetGaiaTeamID
    local SetGameRulesParam = Spring.SetGameRulesParam
    local GetGameRulesParam = Spring.GetGameRulesParam
    local GetTeamResources = Spring.GetTeamResources
    local GetTeamUnitsCounts = Spring.GetTeamUnitsCounts
    local GetTeamUnitCount = Spring.GetTeamUnitCount
    local GetGameFrame = Spring.GetGameFrame
    local GetPlayerList = Spring.GetPlayerList
    local GetPlayerInfo = Spring.GetPlayerInfo
    local GetGameSeconds = Spring.GetGameSeconds
    local DestroyUnit = Spring.DestroyUnit
    local GetTeamUnits = Spring.GetTeamUnits
    local GetUnitsInCylinder = Spring.GetUnitsInCylinder
    local GetUnitNearestEnemy = Spring.GetUnitNearestEnemy
    local GetUnitPosition = Spring.GetUnitPosition
    local GiveOrderToUnit = Spring.GiveOrderToUnit
    local TestBuildOrder = Spring.TestBuildOrder
    local GetGroundBlocked = Spring.GetGroundBlocked
    local CreateUnit = Spring.CreateUnit
    local SetUnitBlocking = Spring.SetUnitBlocking
    local GetGroundHeight = Spring.GetGroundHeight
    local GetUnitTeam = Spring.GetUnitTeam
    local GetUnitHealth = Spring.GetUnitHealth
    local GetUnitCommands = Spring.GetUnitCommands
    local SetUnitExperience = Spring.SetUnitExperience
    local GetUnitDefID = Spring.GetUnitDefID
    local SetUnitHealth = Spring.SetUnitHealth
    local GetUnitIsDead = Spring.GetUnitIsDead
    local GetCommandQueue = Spring.GetCommandQueue
    local GetUnitDirection = Spring.GetUnitDirection
    local Echo = Spring.Echo

    local math = math
    local mRandom = math.random
    local Game = Game
    local table = table
    local ipairs = ipairs
    local pairs = pairs

    --
    -- Utility
    --
    local class = Spring.Utilities.Class
    local SetToList = Spring.Utilities.SetToList
    local SetCount = Spring.Utilities.SetCount
    local Round = Spring.Utilities.Round
    -- enable when needed
    -- local Dump = Spring.Utilities.Dump

    --
    -- Constants
    --
    local UPDATE = 15 -- update every x frames
    local MAXTRIES = 30
    local MAPSIZEX = Game.mapSizeX
    local MAPSIZEZ = Game.mapSizeZ
    local DMAREA = 160
    -- Target units with energymake >= x
    local TARGET_ENERGYMAKE = 400

    local KROW_ID = UnitDefNames["corcrw"].id
    local KROW_LASER = "krow_laser_index"
    local SMALL_UNIT = UnitDefNames["cormaw"].id
    local MEDIUM_UNIT = UnitDefNames["armwin"].id
    local LARGE_UNIT = UnitDefNames["armsolar"].id

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------

    local gameOver = nil
    local noBotWarningMessage = false
    local disabledUnits = {}

    local computerTeams = {}
    local humanTeams = {}

    local luaAI

    do -- load config file
        local CONFIG_FILE
        CONFIG_FILE = "LuaRules/Configs/spawn_defs_robots.lua"
        Echo(CONFIG_FILE)
        local VFSMODE = VFS.RAW_FIRST
        local s = assert(VFS.LoadFile(CONFIG_FILE, VFSMODE))
        local chunk = assert(loadstring(s, file))
        setfenv(chunk, gadget)
        chunk()
    end

    local function chickenEvent(type, num, tech)
        --Echo(type ,num, tech)
        SendToUnsynced("ChickenEvent", type, num, tech)
    end


    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Game End Stuff
    --

    local function KillAllComputerUnits()
        for teamID in pairs(computerTeams) do
            local teamUnits = GetTeamUnits(teamID)
            for _, unitID in pairs(teamUnits) do
                if disabledUnits[unitID] then
                    DestroyUnit(unitID, false, true)
                else
                    DestroyUnit(unitID, true)
                end
            end
        end
    end

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Spawn Dynamics
    --

    local function getPerTeamEIncome()
        local perPlayerEIncome = {}
        local perPlayerPercentage = {}
        local totalIncome = 0
        local eincome = 0
        for teamID, team in pairs(humanTeams) do
            eincome = team:getEIncome()
            perPlayerEIncome[teamID] = eincome
            totalIncome = totalIncome + eincome
        end

        for teamID, eincome in pairs(perPlayerEIncome) do
            perPlayerPercentage[teamID] = eincome / totalIncome
        end

        return perPlayerPercentage
    end

    -- returns a random map position
    local function getRandomMapPos()
        local x = math.random(MAPSIZEX - 16)
        local z = math.random(MAPSIZEZ - 16)
        local y = GetGroundHeight(x, z)
        return {x, y, z}
    end

    local function chooseTeamToAttack()
        local numChickens = 0
        for _, robotTeam in pairs(computerTeams) do
            numChickens = numChickens + robotTeam:getChickenCount()
        end
        local perTeamEIncome = getPerTeamEIncome()

        for teamID, eIncome in pairs(perTeamEIncome) do
            if humanTeams[teamID]:attackThisTeam(Round(numChickens * eIncome)) then
                return teamID
            end
        end

        -- Random team if all teams are full
        local teamList = {}
        for teamID, _ in pairs(humanTeams) do
            table.insert(teamList, teamID)
        end
        return teamList[mRandom(#teamList)]
    end

    -- selects a enemy target
    local function ChooseTarget(unitID)
        if SetCount(humanTeams) == 0 or gameOver then
            return getRandomMapPos()
        end

        -- Select team
        local teamID = chooseTeamToAttack()

        -- Add attacking robot to the team and get best target from it
        local team = humanTeams[teamID]
        return team:addAttackingRobotAndGetTarget(unitID)
    end

    local function SpawnBurrow(count)
        for _, robotTeam in pairs(computerTeams) do
            robotTeam:SpawnBurrows(count)
        end
    end

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Teams
    --

    local Team = class(function(c, teamID)
        c._teamID = teamID
    end)

    function Team:getTeamID()
        return self._teamID
    end

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- HumanTeam class
    --
    local HumanTeam = class(Team, function(c, teamID)
        Team.init(c, teamID)
        c._attackingRobotsCount = 0
        c._attackingRobots = {}

        c._unitsCount = 0
        c._units = {}
    end)

    function HumanTeam:getEIncome()
        _, _, _, eincome = GetTeamResources(self._teamID, "energy")
        return eincome
    end

    function HumanTeam:removeAttackingRobot(unitID)
        if not self._attackingRobots[unitID] then
            return false
        end

        self._attackingRobots[unitID] = nil
        self._attackingRobotsCount = self._attackingRobotsCount - 1
        return true
    end

    function HumanTeam:attackThisTeam(maxTeamRobots)
        if self._attackingRobotsCount >= maxTeamRobots then
            return false
        end

        return true
    end

    function HumanTeam:addUnit(unitID, unitDefID)
        if UnitDefs[unitDefID] and (UnitDefs[unitDefID].energyMake and UnitDefs[unitDefID].energyMake >= TARGET_ENERGYMAKE) then
            self._units[unitID] = true
            self._unitsCount = self._unitsCount + 1
        end
    end

    function HumanTeam:removeUnit(unitID)
        if not self._units[unitID] then
            return false
        end

        self._units[unitID] = nil
        self._unitsCount = self._unitsCount - 1
        return true
    end

    --
    -- Adds the robot unit to attacking units and returns best target of this team to attack
    --
    function HumanTeam:addAttackingRobotAndGetTarget(robotUnitID)
        self._attackingRobotsCount = self._attackingRobotsCount + 1
        self._attackingRobots[robotUnitID] = true

        if self._unitsCount < 1 then
            local units = GetTeamUnits(self._teamID)
            return units[mRandom(#units)]
        end

        local unitsSet = SetToList(self._units)
        return unitsSet[mRandom(#unitsSet)]
    end


    local RobotTeam = class(Team, function(c, teamID, luaAI)
        Team.init(c, teamID)
        c._luaAI = luaAI or NORMAL

        c._queenID = false

        -- box vars
        c.lsx1 = 0
        c.lsz1 = 0
        c.lsx2 = 0
        c.lsz2 = 0

        -- difficulty: by default VERYEASY
        c.chickenSpawnRate  = 100
        c.burrowSpawnRate   = 120
        c.queenSpawnMult    = 0
        c.angerBonus        = 0.05
        c.expStep           = 0
        c.chickenTypes      = {}
        c.defenders         = {}
        c.chickensPerPlayer = 3
        c.spawnChance       = 0.25
        c.damageMod         = 0.6

        -- failing stuff
        c._failBurrows = {}
        c._failChickens = {}

        -- burrows
        c._burrows = {}
        c._minBurrows = 1
        c._burrowTarget = 0

        -- queue's
        c._spawnQueue = {}
        c._deathQueue = {}
        c._idleOrderQueue = {}

        -- Other variables
        c._currentWave = 1
        c._gameTimeSeconds = 0
        c._ascendingQueen = false
        c._queenResistance = {}
        c._timeCounter = 0
        c._queenAnger = 0
        c._isBestRobot = false
        c._chickenCount = 0
        c._chickenDebtCount = 0
        c._chickenBirths = {}
        c._queenLifePercent = 100
        c._nextQueenSpawn = nil
        c._survivalQueenMod = 0.8
        c._oldDamageMod = 1
        c._firstSpawn = true
        c._timeOfLastSpawn = 0
        c._timeOfLastFakeSpawn = 0
        c._timeOfLastWave = 0
        c._lastWave = 1
        c._burrowAnger = 0
        c._qDamage = 0
        c._qMove = false
        c._queenMaxHP = 0

        -- Settings
        c._maxChicken = settingMaxChicken
        -- to save maxChicken in SURVIVAL mod
        c._oldMaxChicken = 0
        c._queenName = settingQueenName
        c._maxAge = settingMaxAge
        c._bonusTurret = settingBonusTurret
        c._queenTime = settingQueenTime + settingGracePeriod
    end)

    function RobotTeam:setUp(isBestRobot)
        -- load/set difficulty
        for key, value in pairs(gadget.difficulties[self._luaAI]) do
            self[key] = value
        end

        self:_getDefTypes()

        self._expMod = 0
        if self.expStep > 0 then
            self._expIncrement = ((SetCount(humanTeams) * self.expStep) / settingQueenTime)
        else
           self._expIncrement = ((self.expStep * -1) / settingQueenTime)
        end

        -- Queentime in x waves in 60 seconds
        self._nextWave = self._queenTime / (#waves + 1)

        self._isBestRobot = isBestRobot
        if isBestRobot == true then
            SetGameRulesParam("queenLife", self._queenLifePercent)
            SetGameRulesParam("queenAnger", self._queenAnger)
            SetGameRulesParam("chickenSpawnRate", self.chickenSpawnRate)
        end

        -- queen
        if (self._queenName == "asc") then
            self._queenName = "ve_chickenqr"
            self._ascendingQueen = true
        end
    end

    function RobotTeam:_getDefTypes()
        self._chickenDefTypes = {}
        self._unitCounts = {}
        self._defendersDefs = {}

        for unitName in pairs(self.chickenTypes) do
            --Echo("Adding unitname to spawner database:= " .. unitName)
            self._chickenDefTypes[UnitDefNames[unitName].id] = unitName
            self._unitCounts[(unitName)] = {count = 0, lastCount = 0}

            -- this is needed for the GUI widget
            SetGameRulesParam(unitName .. "Count", 0)
            SetGameRulesParam(unitName .. "Kills", 0)
        end

        for unitName in pairs(self.defenders) do
            self._defendersDefs[UnitDefNames[unitName].id] = unitName

            -- this is needed for the GUI widget
            SetGameRulesParam(unitName .. "Count", 0)
            SetGameRulesParam(unitName .. "Kills", 0)
        end

        -- this is needed for the GUI widget
        SetGameRulesParam(burrowName .. "Count", 0)
        SetGameRulesParam(burrowName .. "Kills", 0)
    end

    function RobotTeam:GameStart()
        if (burrowSpawnType == "initialbox") or (burrowSpawnType == "alwaysbox") then
            local _, _, _, _, _, luaAllyID = Spring.GetTeamInfo(self._teamID)
            if luaAllyID then
                self.lsx1, self.lsz1, self.lsx2, self.lsz2 = Spring.GetAllyTeamStartBox(luaAllyID)
                if (not self.lsx1) or (not self.lsz1) or (not self.lsx2) or (not self.lsz2) then
                    burrowSpawnType = "avoid"
                    Echo("No Chicken start box available, Burrow Placement set to 'Avoid Players'")
                elseif (self.lsx1 == 0) and (self.lsz1 == 0) and (self.lsx2 == MAPSIZEX) and (self.lsz2 == MAPSIZEZ) then
                    burrowSpawnType = "avoid"
                    Echo("No Chicken start box available, Burrow Placement set to 'Avoid Players'")
                end
            end
        end
    end

    function RobotTeam:getDamageMod()
        return self.damageMod
    end

    function RobotTeam:getChickenSpawnLoc(burrowID, size)
        local x, y, z
        local bx, by, bz = GetUnitPosition(burrowID)
        if (not bx or not bz) then
            return false
        end

        local tries = 0
        local s = spawnSquare

        repeat
            x = mRandom(bx - s, bx + s)
            z = mRandom(bz - s, bz + s)
            s = s + spawnSquareIncrement
            tries = tries + 1
            if (x >= MAPSIZEX) then
                x = (MAPSIZEX - mRandom(1, 40))
            elseif (x <= 0) then
                x = mRandom(1, 40)
            end
            if (z >= MAPSIZEZ) then
                z = (MAPSIZEZ - mRandom(1, 40))
            elseif (z <= 0) then
                z = mRandom(1, 40)
            end
        until ((TestBuildOrder(size, x, by, z, 1) == 2) and (not GetGroundBlocked(x, z))) or (tries > MAXTRIES)

        y = GetGroundHeight(x, z)
        return x, y, z
    end

    function RobotTeam:SpawnBurrows(count)
        -- don't spawn new burrows when queen is there
        if self._queenID then
            return
        end

        for i = 1, (count or 1) do
            local x, z, y
            local tries = 0
            repeat
                if (burrowSpawnType == "initialbox") then
                    x = mRandom(self.lsx1, self.lsx2)
                    z = mRandom(self.lsz1, self.lsz2)
                elseif ((burrowSpawnType == "alwaysbox") and (tries < MAXTRIES)) then
                    x = mRandom(self.lsx1, self.lsx2)
                    z = mRandom(self.lsz1, self.lsz2)
                elseif (burrowSpawnType == "initialbox_post") then
                    lsx1 = math.max(self.lsx1 * 0.975, spawnSquare)
                    lsz1 = math.max(self.lsz1 * 0.975, spawnSquare)
                    lsx2 = math.min(self.lsx2 * 1.025, MAPSIZEX - spawnSquare)
                    lsz2 = math.min(self.lsz2 * 1.025, MAPSIZEZ - spawnSquare)
                    x = mRandom(self.lsx1, self.lsx2)
                    z = mRandom(self.lsz1, self.lsz2)
                else
                    x = mRandom(spawnSquare, MAPSIZEX - spawnSquare)
                    z = mRandom(spawnSquare, MAPSIZEZ - spawnSquare)
                end

                y = GetGroundHeight(x, z)
                tries = tries + 1
                local blocking = TestBuildOrder(MEDIUM_UNIT, x, y, z, 1)
                if (blocking == 2) and ((burrowSpawnType == "avoid") or (burrowSpawnType == "initialbox_post")) then
                    local proximity = GetUnitsInCylinder(x, z, minBaseDistance)
                    local vicinity = GetUnitsInCylinder(x, z, maxBaseDistance)
                    local humanUnitsInVicinity = false
                    local humanUnitsInProximity = false
                    for i = 1, #vicinity, 1 do
                        if (GetUnitTeam(vicinity[i]) ~= self._teamID) then
                            humanUnitsInVicinity = true
                            break
                        end
                    end

                    for i = 1, #proximity, 1 do
                        if (GetUnitTeam(proximity[i]) ~= self._teamID) then
                            humanUnitsInProximity = true
                            break
                        end
                    end

                    if (humanUnitsInProximity or not humanUnitsInVicinity) then
                        blocking = 1
                    end
                end
            until (blocking == 2 or tries > (MAXTRIES * 2))

            local unitID = CreateUnit(burrowName, x, y, z, "n", self._teamID)
            if (unitID) then
                self._burrows[unitID] = 0
                SetUnitBlocking(unitID, false, false)
                SetUnitExperience(unitID, mRandom() * self._expMod)
                Spring.SetUnitMaxHealth(unitID, settingBurrowhp)
                Spring.SetUnitHealth(unitID, settingBurrowhp)
            end
        end
    end

    function RobotTeam:SpawnTurret(burrowID, turret)
        if (mRandom() > defenderChance) or (not turret) or (self._burrows[burrowID] >= maxTurrets) then
            return
        end

        local x, y, z
        local bx, by, bz = GetUnitPosition(burrowID)
        if (not bx) then
            return
        end
        local tries = 0
        local s = spawnSquare

        repeat
            x = mRandom(bx - s, bx + s)
            z = mRandom(bz - s, bz + s)
            s = s + spawnSquareIncrement
            tries = tries + 1
            if (x >= MAPSIZEX) then
                x = (MAPSIZEX - mRandom(1, 40))
            elseif (x <= 0) then
                x = mRandom(1, 40)
            end
            if (z >= MAPSIZEZ) then
                z = (MAPSIZEZ - mRandom(1, 40))
            elseif (z <= 0) then
                z = mRandom(1, 40)
            end
        until (not GetGroundBlocked(x, z) or tries > MAXTRIES)

        y = GetGroundHeight(x, z)
        local unitID = CreateUnit(turret, x, y, z, "n", self._teamID)
        if unitID then
            self._idleOrderQueue[unitID] = {cmd = CMD.PATROL, params = {bx, by, bz}, opts = {"meta"}}
            SetUnitBlocking(unitID, false, false)
            SetUnitExperience(unitID, mRandom() * self._expMod)
            turrets[unitID] = {burrowID, t}
            self._burrows[burrowID] = self._burrows[burrowID] + 1
        end
    end

    function RobotTeam:SpawnRobots()
        local i, defs = next(self._spawnQueue)
        if not i or not defs then
            return
        end
        local x, y, z
        if (self._queenID) then
            x, y, z = self:getChickenSpawnLoc(defs.burrow, MEDIUM_UNIT)
        else
            x, y, z = self:getChickenSpawnLoc(defs.burrow, SMALL_UNIT)
        end
        if not x or not y or not z then
            self._spawnQueue[i] = nil
            return
        end
        local unitID = CreateUnit(defs.unitName, x, y, z, "n", defs.team)
        if unitID then
            SetUnitExperience(unitID, mRandom() * expMod)
            if (mRandom() < 0.1) then
                local mod = 0.75 - (mRandom() * 0.25)
                if (mRandom() < 0.1) then
                    mod = mod - (mRandom() * 0.2)
                    if (mRandom() < 0.1) then
                        mod = mod - (mRandom() * 0.2)
                    end
                end
            end

            if UnitDefs[GetUnitDefID(unitID)].canFly then
                GiveOrderToUnit(unitID, CMD.IDLEMODE, {0}, {"shift"})
            end

            if (self._queenID) then
                self._idleOrderQueue[unitID] = {cmd = CMD.FIGHT, params = getRandomMapPos(), opts = {}}
            else
                local targetPosition = {GetUnitPosition(ChooseTarget(unitID))}
                self._idleOrderQueue[unitID] = {cmd = CMD.FIGHT, params = targetPosition, opts = {}}
                self._chickenBirths[unitID] = {deathDate = self._gameTimeSeconds + self._maxAge, burrowID = defs.burrow}

                self._chickenCount = self._chickenCount + 1
            end
        end
        self._spawnQueue[i] = nil
    end

    function RobotTeam:_spawnQueen()
        if (self._nextQueenSpawn ~= nil) then
            return CreateUnit(self._queenName, self._nextQueenSpawn.x, self._nextQueenSpawn.y, self._nextQueenSpawn.z, "n", self._teamID)
        end

        local bestScore = 0
        local sx, sy, sz
        for burrowID, turretCount in pairs(self._burrows) do
            -- Try to spawn the queen at the 'best' burrow
            local x, y, z = GetUnitPosition(burrowID)
            if x and y and z then
                local score = 0
                score = score + (mRandom() * turretCount)
                if self._failBurrows[burrowID] then
                    score = score - (self._failBurrows[burrowID] * 5)
                end
                if (score > bestScore) then
                    bestScore = score
                    sx = x
                    sy = y
                    sz = z
                end
            end
        end

        if sx and sy and sz then
            return CreateUnit(self._queenName, sx, sy, sz, "n", self._teamID)
        end

        local x, y, z
        local tries = 0

        repeat
            x = mRandom(1, (MAPSIZEX - 1))
            z = mRandom(1, (MAPSIZEZ - 1))
            y = GetGroundHeight(x, z)
            tries = tries + 1
            local blocking = TestBuildOrder(LARGE_UNIT, x, y, z, 1)

            local proximity = GetUnitsInCylinder(x, z, minBaseDistance)
            local vicinity = GetUnitsInCylinder(x, z, maxBaseDistance)
            local humanUnitsInVicinity = false
            local humanUnitsInProximity = false

            for i = 1, #vicinity, 1 do
                if (GetUnitTeam(vicinity[i]) ~= self._teamID) then
                    humanUnitsInVicinity = true
                    break
                end
            end

            for i = 1, #proximity, 1 do
                if (GetUnitTeam(proximity[i]) ~= self._teamID) then
                    humanUnitsInProximity = true
                    break
                end
            end

            if (humanUnitsInProximity or not humanUnitsInVicinity) then
                blocking = 1
            end
        until (blocking == 2 or tries > (MAXTRIES * 3))

        return CreateUnit(self._queenName, x, y, z, "n", self._teamID)
    end

    function RobotTeam:updateSpawnQueen()
        if self._queenID or gameOver then
            return
        end

        self._queenID = self:_spawnQueen()

        self._idleOrderQueue[self._queenID] = {cmd = CMD.MOVE, params = {GetUnitPosition(ChooseTarget(self._queenID))}, opts = {}}
        self._burrows[self._queenID] = 0
        self._spawnQueue = {}
        self._oldMaxChicken = self._maxChicken
        self._oldDamageMod = self.damageMod
        self._maxChicken = 75
        chickenEvent("queen") -- notify unsynced about queen spawn
        _, self._queenMaxHP = GetUnitHealth(self._queenID)
        SetUnitExperience(self._queenID, self._expMod)
        self._timeOfLastWave = self._gameTimeSeconds

        local chickenUnits = GetTeamUnits(self._teamID)

        if (queenName == "fh_chickenqr") then
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "irritator", team = self._teamID})
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "irritator", team = self._teamID})
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "irritator", team = self._teamID})
        end

        if (modes[highestLevel] == INSANE) then
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "abroadside", team = self._teamID})
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "cdevastator", team = self._teamID})
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "tllvaliant", team = self._teamID})
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "tllvaliant", team = self._teamID})
        end

        for i = 1, 100, 1 do
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "airwolf3g", team = self._teamID})
        end

        for i = 1, 30, 1 do
            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "corkarg", team = self._teamID})
        end

        for i = 1, 10, 1 do
            if (mRandom() < spawnChance) then
                table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "corcrw", team = self._teamID})
                table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "gorg", team = self._teamID})
            end
        end
    end

    function RobotTeam:_killOldChicken()
        for unitID, defs in pairs(self._chickenBirths) do
            if (self._gameTimeSeconds > defs.deathDate) then
                if (unitID ~= self._queenID) then
                    self._deathQueue[unitID] = {selfd = false, reclaimed = false}
                    self._chickenCount = self._chickenCount - 1
                    self._chickenDebtCount = self._chickenDebtCount + 1
                    local failCount = self._failBurrows[defs.burrowID]
                    if (self._failBurrows[defs.burrowID] == nil) then
                        self._failBurrows[defs.burrowID] = 5
                    else
                        self._failBurrows[defs.burrowID] = failCount + 5
                    end
                end
            end
        end
    end

    function RobotTeam:KillAllRobots()
        local chickenUnits = GetTeamUnits(self._teamID)
        for _, unitID in pairs(chickenUnits) do
            if disabledUnits[unitID] then
                DestroyUnit(unitID, false, true)
            else
                DestroyUnit(unitID, true)
            end
        end
    end

    function RobotTeam:UnitDestroyed(unitID, unitDefID, attackerID)
        if self._chickenBirths[unitID] then
            self._chickenBirths[unitID] = nil
        end
        if turrets[unitID] then
            turrets[unitID] = nil
        end
        if self._idleOrderQueue[unitID] then
            self._idleOrderQueue[unitID] = nil
        end
        if self._failChickens[unitID] then
            self._failChickens[unitID] = nil
        end
        if self._failBurrows[unitID] then
            self._failBurrows[unitID] = nil
            return
        end

        local name = UnitDefs[unitDefID].name
        local kills = GetGameRulesParam(name .. "Kills")
        if kill then
            SetGameRulesParam(name .. "Kills", kills + 1)
        end
        self._chickenCount = self._chickenCount - 1

        if (unitID == self._queenID) then -- queen destroyed
            self._queenID = nil
            self._maxChicken = self._oldMaxChicken
            self.damageMod = self._oldDamageMod
            self._queenResistance = {}
            if (self._ascendingQueen == true) then
                local x, y, z = GetUnitPosition(unitID)
                self._nextQueenSpawn = {x = x, y = y, z = z}
                if (self._queenName == "ve_chickenqr") then
                    self._queenName = "e_chickenqr"
                elseif (self._queenName == "e_chickenqr") then
                    self._queenName = "n_chickenqr"
                elseif (self._queenName == "n_chickenqr") then
                    self._queenName = "h_chickenqr"
                elseif (self._queenName == "h_chickenqr") then
                    self._queenName = "vh_chickenqr"
                elseif (self._queenName == "vh_chickenqr") then
                    self._queenName = "fh_chickenqr"
                    self._ascendingQueen = false
                    self._nextQueenSpawn = nil
                end
                self:updateSpawnQueen()
            else
                if modes[highestLevel] == SURVIVAL then
                    self._queenTime = self._gameTimeSeconds + (((Spring.GetModOptions().mo_queentime or 40) * 60) * self._survivalQueenMod)
                    self._survivalQueenMod = self._survivalQueenMod * 0.8
                    self._queenAnger = 0 -- reenable chicken spawning
                    self._burrowAnger = 0
                    if self._isBestRobot then
                        SetGameRulesParam("queenAnger", self._queenAnger)
                    end
                    self:SpawnBurrows()
                    self:SpawnRobots() -- spawn new chickens (because queen could be the last one)
                else
                    gameOver = GetGameFrame() + 120
                    self._spawnQueue = {}

                    self:KillAllRobots()
                end
            end
        end

        if (unitDefID == settingBurrowDef) and (not gameOver) then
            local kills = GetGameRulesParam(burrowName .. "Kills")
            SetGameRulesParam(burrowName .. "Kills", kills + 1)

            self._burrows[unitID] = nil
            if (settingAddQueenAnger == 1) then
                burrowAnger = (burrowAnger + self.angerBonus)
                self._expMod = (self._expMod + self.angerBonus)
            end

            for turretID, v in pairs(turrets) do
                if (v[1] == unitID) then
                    local x, y, z = GetUnitPosition(turretID)
                    if x and y and z then
                        Spring.SpawnCEG("blood_explode", x, y, z, 0, 0, 0)
                        local h = Spring.GetUnitHealth(turretID)
                        if h then
                            Spring.SetUnitHealth(turretID, h * 0.333)
                        end
                    end
                    self._idleOrderQueue[turretID] = {cmd = CMD.STOP, params = {}, opts = {}}
                    turrets[turretID] = nil
                end
            end

            for burrowID in pairs(self._burrows) do
                if (self._currentWave >= 5 and self._currentWave <= 6) then
                    if (mRandom(0, 1) == 1) then
                        self._bonusTurret = bonusTurret5a
                    else
                        self._bonusTurret = bonusTurret5b
                    end
                elseif (self._currentWave >= 7) then
                    local rannum = mRandom(0, 3)
                    if rannum == 0 then
                        self._bonusTurret = bonusTurret7a
                    end
                    if rannum == 1 then
                        self._bonusTurret = bonusTurret5b
                    end
                    if rannum == 2 then
                        self._bonusTurret = bonusTurret7b
                    end
                    if rannum == 3 then
                        self._bonusTurret = bonusTurret7c
                    end
                end
                self:SpawnTurret(burrowID, self._bonusTurret)
            end

            for i, defs in pairs(self._spawnQueue) do
                if (defs.burrow == unitID) then
                    self._spawnQueue[i] = nil
                end
            end

            SetGameRulesParam("rroostCount", SetCount(burrows))
        end
    end

    function RobotTeam:UnitIdle(unitID, unitDefID)
        local failCount = self._failChickens[unitID]
        if (failCount == nil) then
            if (unitID ~= self._queenID) then
                self._failChickens[unitID] = 1
            end
        else
            self._failChickens[unitID] = failCount + 1
        end

        local target = ChooseTarget(unitID)
        local targetPos = {GetUnitPosition(target)}
        self._idleOrderQueue[unitID] = {cmd = CMD.FIGHT, params = targetPos, opts = {}}
        if GetUnitNeutral(target) then
            self._idleOrderQueue[unitID] = {cmd = CMD.ATTACK, params = targetPos, opts = {}}
        end
    end

    function RobotTeam:UnitDamaged(
        unitID,
        unitDefID,
        unitTeam,
        damage,
        paralyzer,
        weaponID,
        projectileID,
        attackerID,
        attackerDefID,
        attackerTeam)
        if self._chickenBirths[attackerID] then
            self._chickenBirths[attackerID].deathDate = (self._gameTimeSeconds + self._maxAge)
        end
        if self._failChickens[attackerID] then
            self._failChickens[attackerID] = nil
        end
        if self._failChickens[unitID] then
            self._failChickens[unitID] = nil
        end

        if (unitID == self._queenID) then
            if paralyzer then
                SetUnitHealth(unitID, {paralyze = 0})
                return
            end
            self._qDamage = (self._qDamage + damage)
            if (self._qDamage > (self._queenMaxHP / 10)) then
                if self._qMove then
                    self._idleOrderQueue[self._queenID] = {cmd = CMD.STOP, params = {}, opts = {}}
                    self._qMove = false
                    self._qDamage = 0 - mRandom(0, 100000)
                else
                    local cC = {GetUnitPosition(ChooseTarget(self._queenID))}
                    local xQ, _, zQ = GetUnitPosition(self._queenID)
                    if cC then
                        local angle = math.atan2((cC[1] - xQ), (cC[3] - zQ))
                        local dist = math.sqrt(((cC[1] - xQ) * (cC[1] - xQ)) + ((cC[3] - zQ) * (cC[3] - zQ))) * 0.75
                        t = GetGameSeconds()
                        if (dist < 1700) then
                            GiveOrderToUnit(
                                self._queenID,
                                CMD.MOVE,
                                {(xQ + (math.sin(angle) * dist)), cC[2], (zQ + (math.cos(angle) * dist))},
                                {}
                            )
                            GiveOrderToUnit(queenID, CMD.FIGHT, cC, {"shift"})
                            self._qDamage = 0 - mRandom(50000, 250000)
                            for _, robotTeam in pairs(computerTeams) do
                                robotTeam:Wave()
                            end
                            qMove = true
                        else
                            self._idleOrderQueue[queenID] = {cmd = CMD.STOP, params = {}, opts = {}}
                            self._qDamage = 0
                            for _, robotTeam in pairs(computerTeams) do
                                robotTeam:Wave()
                            end
                        end
                        for i = 1, 5, 1 do
                            self:SpawnTurret(self._queenID, bonusTurret)
                        end
                    else
                        self._idleOrderQueue[queenID] = {cmd = CMD.STOP, params = {}, opts = {}}
                        self._qDamage = 0
                    end
                end
            end
        end
    end

    function RobotTeam:Wave()

        if gameOver then
            return
        end

        self._currentWave = math.min(Round((((self._gameTimeSeconds - settingGracePeriod) / 60) / self._nextWave)), #waves)

        if (self._queenAnger >= 100) then
            self._currentWave = #waves
        end

        -- Echo("CurrentWave: ", currentWave, "#Waves: ", #waves)

        local cCount = 0

        if self._queenID then -- spawn units from queen
            if self.queenSpawnMult > 0 then
                for i = 1, self.queenSpawnMult, 1 do
                    local squad = waves[9][mRandom(1, #waves[9])]
                    for i, sString in pairs(squad) do
                        local nEnd, _ = string.find(sString, " ")
                        local unitCount = string.sub(sString, 1, (nEnd - 1))
                        local chickenName = string.sub(sString, (nEnd + 1))
                        for i = 1, unitCount, 1 do
                            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = chickenName, team = self._teamID})
                        end
                        cCount = cCount + unitCount
                    end
                end
            end
            return cCount
        end

        for burrowID in pairs(self._burrows) do
            if (self._gameTimeSeconds > (self._queenTime * 0.15)) then
                self:SpawnTurret(burrowID, bonusTurret)
            end
            local squad = waves[self._currentWave][mRandom(1, #waves[self._currentWave])]
            if ((self._lastWave ~= self._currentWave) and (newWaveSquad[self._currentWave])) then
                squad = newWaveSquad[self._currentWave]
                self._lastWave = self._currentWave
            end
            for i, sString in pairs(squad) do
                local skipSpawn = false
                if (cCount > chickensPerPlayer) and (mRandom() > spawnChance) then
                    skipSpawn = true
                end
                if skipSpawn and (chickenDebtCount > 0) and (mRandom() > spawnChance) then
                    chickenDebtCount = (chickenDebtCount - 1)
                    skipSpawn = false
                end
                if not skipSpawn then
                    local nEnd, _ = string.find(sString, " ")
                    local unitCount = string.sub(sString, 1, (nEnd - 1))
                    local chickenName = string.sub(sString, (nEnd + 1))
                    --Echo("chickenname is : " ..chickenName)

                    for i = 1, unitCount, 1 do
                        table.insert(self._spawnQueue, {burrow = burrowID, unitName = chickenName, team = self._teamID})
                    end
                    cCount = cCount + unitCount
                end
            end
        end
        return cCount
    end

    function RobotTeam:_removeFailChickens()
        -- remove burrows which robots never reached the enemy
        for unitID, failCount in pairs(self._failBurrows) do
            if (failCount > 30) then
                self._deathQueue[unitID] = {selfd = false, reclaimed = false}
                self._burrows[unitID] = nil
                self._failBurrows[unitID] = nil
                for i, defs in pairs(self._spawnQueue) do
                    if (defs.burrow == unitID) then
                        self._spawnQueue[i] = nil
                    end
                end
                self:SpawnBurrows(1)
            end
        end

        for unitID, failCount in pairs(self._failChickens) do
            local checkedForDT = false
            if (unitID ~= self._queenID) or (GetUnitTeam(unitID) ~= self._teamID) then
                if (failCount > 5) then
                    local x, y, z = GetUnitPosition(unitID)
                    local yh = GetGroundHeight(x, z)
                    if y and yh and (y < (yh + 1)) then
                        self._deathQueue[unitID] = {selfd = false, reclaimed = true}
                        self._chickenCount = self._chickenCount - 1
                        self._chickenDebtCount = self._chickenDebtCount + 1
                        if self._chickenBirths[unitID] then
                            local burrowFailCount = self._failBurrows[self._chickenBirths[unitID].burrowID]
                            if (burrowFailCount == nil) then
                                self._failBurrows[self._chickenBirths[unitID].burrowID] = 1
                            else
                                self._failBurrows[self._chickenBirths[unitID].burrowID] = burrowFailCount + 1
                            end
                        end
                    end
                elseif (failCount > 2) then
                    local x, y, z = GetUnitPosition(unitID)
                    local attackingFeature = false
                    if (not checkedForDT) then
                        checkedForDT = true
                        local nearFeatures = Spring.GetFeaturesInSphere(x, y, z, 70)
                        for i, featureID in ipairs(nearFeatures) do
                            local featureDefID = Spring.GetFeatureDefID(featureID)
                            if
                                (featureDefID) and (FeatureDefs[featureDefID].metal > 0) and
                                    (not FeatureDefs[featureDefID].autoReclaimable)
                             then
                                local fx, fy, fz = Spring.GetFeaturePosition(featureID)
                                self._idleOrderQueue[unitID] = {cmd = CMD.ATTACK, params = {fx, fy, fz}, opts = {}}
                                attackingFeature = true
                                break
                            end
                        end
                    end
                    if (not attackingFeature) then
                        local dx, _, dz = GetUnitDirection(unitID)
                        local angle = math.atan2(dx, dz)
                        Spring.SpawnCEG("dirt2", x, y, z, 0, 0, 0)
                        if (y < -15) then
                            self._deathQueue[unitID] = {selfd = false, reclaimed = false}
                            self._chickenCount = self._chickenCount - 1
                            self._chickenDebtCount = self._chickenDebtCount + 1
                            if self._chickenBirths[unitID] then
                                local burrowFailCount = self._failBurrows[self._chickenBirths[unitID].burrowID]
                                if (burrowFailCount == nil) then
                                    self._failBurrows[self._chickenBirths[unitID].burrowID] = 3
                                else
                                    self._failBurrows[self._chickenBirths[unitID].burrowID] = burrowFailCount + 3
                                end
                            end
                        end
                        Spring.AddUnitImpulse(unitID, math.sin(angle) * 2, 2.5, math.cos(angle) * 2, 100)
                    end
                end
            end
            self._failChickens = {}
        end
    end

    function RobotTeam:GameFrame(n)
        if ((n % 90) == 0) then
            self:_removeFailChickens()
            if (self._queenAnger >= 100) then
                damageMod = (damageMod + 0.005)
            end
        end

        if (self._chickenCount < self._maxChicken) then
            self:SpawnRobots()
        end

        for unitID, defs in pairs(self._deathQueue) do
            if ValidUnitID(unitID) and not GetUnitIsDead(unitID) then
                DestroyUnit(unitID, defs.selfd or false, defs.reclaimed or false)
            end
        end

        if (n >= self._timeCounter) then
            self._timeCounter = (n + UPDATE)
            self._gameTimeSeconds = GetGameSeconds()
            if not self._queenID then
                if self._gameTimeSeconds < settingGracePeriod then
                    self._queenAnger = 0
                else
                    self._queenAnger =
                        math.ceil(
                        math.min((self._gameTimeSeconds - settingGracePeriod) / (self._queenTime - settingGracePeriod) * 100 % 100) + self._burrowAnger,
                        100
                    )
                end
                SetGameRulesParam("queenAnger", self._queenAnger)
            end
            self:_killOldChicken()

            if (self._gameTimeSeconds < settingGracePeriod) then -- do nothing in the grace period
                return
            end

            self._expMod = (self._expMod + self._expIncrement) -- increment expierence

            if next(self._idleOrderQueue) then
                local processOrderQueue = {}
                for unitID, order in pairs(self._idleOrderQueue) do
                    if GetUnitDefID(unitID) then
                        processOrderQueue[unitID] = order
                    end
                end
                self._idleOrderQueue = {}
                for unitID, order in pairs(processOrderQueue) do
                    GiveOrderToUnit(unitID, order.cmd, order.params, order.opts)
                    GiveOrderToUnit(unitID, CMD.MOVE_STATE, {mRandom(0, 2)}, {"shift"})
                    if UnitDefs[GetUnitDefID(unitID)].canFly then
                        GiveOrderToUnit(unitID, CMD.AUTOREPAIRLEVEL, {mRandom(0, 3)}, {"shift"})
                    end
                end
            end

            if self._queenAnger >= 100 then -- check if the queen should be alive
                self:updateSpawnQueen()
                self:_updateQueenLife()
            end

            local quicken = 0
            local burrowCount = SetCount(self._burrows)

            if (self.burrowSpawnRate < (self._gameTimeSeconds - self._timeOfLastFakeSpawn) and self._burrowTarget < settingMaxBurrows) then
                -- This block is all about setting the correct burrow target
                if self._firstSpawn then
                    self._minBurrows = SetCount(humanTeams)
                    local hteamID = next(humanTeams)
                    local ranCount = GetTeamUnitCount(hteamID)
                    for i = 1, ranCount, 1 do
                        mRandom()
                    end
                    self._burrowTarget = math.max(math.min(math.ceil(self._minBurrows * 1.5), 40), 1)
                else
                    self._burrowTarget = self._burrowTarget + 1
                end
                self._timeOfLastFakeSpawn = self._gameTimeSeconds
            end

            if (self._burrowTarget > 0) and (self._burrowTarget ~= burrowCount) then
                quicken = (self.burrowSpawnRate * (1 - (burrowCount / self._burrowTarget)))
            end

            if (self._burrowTarget > 0) and ((burrowCount / self._burrowTarget) < 0.40) then
                -- less than 40% of desired burrows, spawn one right away
                quicken = self.burrowSpawnRate
            end

            local burrowSpawnTime = (self.burrowSpawnRate - quicken)

            if (burrowCount < minBurrows) or (burrowSpawnTime < (self._gameTimeSeconds - self._timeOfLastSpawn) and burrowCount < settingMaxBurrows) then
                if self._firstSpawn then
                    self._timeOfLastWave = (self._gameTimeSeconds - (self.chickenSpawnRate - 6))
                    self._firstSpawn = false
                    if (burrowSpawnType == "initialbox") then
                        burrowSpawnType = "initialbox_post"
                    end
                else
                    self:SpawnBurrows()
                end
                if (burrowCount >= self._minBurrows) then
                    self._timeOfLastSpawn = self._gameTimeSeconds
                end
                chickenEvent("burrowSpawn")
                SetGameRulesParam("rroostCount", SetCount(self._burrows))
            end

            if (burrowCount > 0) and (self.chickenSpawnRate < (self._gameTimeSeconds - self._timeOfLastWave)) then
                local cCount = 0
                for _, robotTeam in pairs(computerTeams) do
                    cCount = cCount + robotTeam:Wave()
                end
                if cCount and cCount > 0 and (not self._queenID) then
                    chickenEvent("wave", cCount, self._currentWave)
                end
                self._timeOfLastWave = self._gameTimeSeconds
            end
            self._chickenCount = self:updateUnitCount()
        end
    end

    function RobotTeam:getChickenCount()
        return self._chickenCount
    end

    function RobotTeam:KingPreDamaged(
        unitID,
        unitDefID,
        unitTeam,
        damage,
        paralyzer,
        weaponID,
        projectileID,
        attackerID,
        attackerDefID,
        attackerTeam)

        if (unitID == self._queenID) then -- special case KING
            -- prevents dguns
            if (weaponID == -1) and (damage > 25000) then
                return 25000
            end

            if attackerDefID then
                if (attackerDefID == KROW_ID) then
                    weaponID = KROW_LASER
                end
                if not self._queenResistance[weaponID] then
                    self._queenResistance[weaponID] = {}
                    self._queenResistance[weaponID].damage = damage
                    self._queenResistance[weaponID].notify = 0
                end
                local resistPercent = (math.min(self._queenResistance[weaponID].damage / self._queenMaxHP, 0.75) + 0.2)
                if resistPercent > 0.35 then
                    if self._queenResistance[weaponID].notify == 0 then
                        local weaponName
                        if (attackerDefID == KROW_ID) then
                            weaponName = "HighEnergyLaser"
                        else
                            weaponName = WeaponDefs[weaponID].description
                        end
                        Echo(
                            "Queen is becoming resistant to " ..
                                UnitDefs[attackerDefID].humanName .. "'s attacks (" .. weaponName .. ")"
                        )
                        self._queenResistance[weaponID].notify = 1
                        for i = 1, 20, 1 do
                            table.insert(self._spawnQueue, {burrow = self._queenID, unitName = "corkarg", team = self._teamID})
                        end
                    end
                    damage = damage - (damage * resistPercent)
                end
                self._queenResistance[weaponID].damage = self._queenResistance[weaponID].damage + damage
                return damage
            end
        end

        return damage
    end

    function RobotTeam:_updateQueenLife()
        if not self._queenID or not self._isBestRobot then
            return
        end

        local curH, maxH = GetUnitHealth(self._queenID)
        local lifeCheck = math.ceil(((curH / maxH) * 100) - 0.5)
        if self._queenLifePercent ~= lifeCheck then -- health changed since last update, update it
            self._queenLifePercent = lifeCheck
            SetGameRulesParam("queenLife", self._queenLifePercent)
        end
    end

    function RobotTeam:updateUnitCount()
        local teamUnitCounts = GetTeamUnitsCounts(self._teamID)
        local total = 0

        for shortName in pairs(self._unitCounts) do
            self._unitCounts[shortName].count = 0
        end

        for unitDefID, count in pairs(teamUnitCounts) do
            if UnitDefs[unitDefID] then
                local shortName
                shortName = (UnitDefs[unitDefID].name)
                if self._unitCounts[shortName] then
                    self._unitCounts[shortName].count = self._unitCounts[shortName].count + count
                end
            end
        end

        for shortName, counts in pairs(self._unitCounts) do
            if (counts.count ~= counts.lastCount) then
                if self._isBestRobot then
                    SetGameRulesParam(shortName .. "Count", counts.count)
                end
                counts.lastCount = counts.count
            end
            total = total + counts.count
        end

        return total
    end

    local modes = {
        [1] = VERYEASY,
        [2] = EASY,
        [3] = NORMAL,
        [4] = HARD,
        [5] = VERYHARD,
        [6] = INSANE,
        [7] = CUSTOM,
        [8] = SURVIVAL
    }

    for i, v in ipairs(modes) do -- make it bi-directional
        modes[v] = i
    end

    local teamsRAW = GetTeamList()
    local highestLevel = 0
    local highestLevelTeamID = 0
    for _, teamID in ipairs(teamsRAW) do
        local teamLuaAI = GetTeamLuaAI(teamID)
        if (teamLuaAI and teamLuaAI ~= "") then
            if (modes[teamLuaAI] > highestLevel) then -- get chicken ai with highest level
                luaAI = teamLuaAI
                highestLevel = modes[teamLuaAI]
                highestLevelTeamID = teamID
            end
            computerTeams[teamID] = RobotTeam(teamID, teamLuaAI)
        else
            humanTeams[teamID] = HumanTeam(teamID)
        end
    end

    luaAI = modes[highestLevel]

    local gaiaTeamID = GetGaiaTeamID()
    if SetCount(computerTeams) < 1 then
        noBotWarningMessage = true
    else
        computerTeams[gaiaTeamID] = nil
    end

    humanTeams[gaiaTeamID] = nil

    SetGameRulesParam("chickenTeamID", highestLevelTeamID)

    -- Set all robotsteam up, highestlevel team last
    for teamID, robotTeam in pairs(computerTeams) do
        if teamID ~= highestLevelTeamID then
            robotTeam:setUp(false)
        end
    end
    computerTeams[highestLevelTeamID]:setUp(true)

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Difficulty
    --

    local function SetGlobals(difficulty)
        for key, value in pairs(gadget.difficulties[difficulty]) do
            gadget[key] = value
        end
        gadget.difficulties = nil
    end

    SetGlobals(luaAI or NORMAL) -- set difficulty

    chickensPerPlayer = (chickensPerPlayer * SetCount(humanTeams))

    chickenDebtCount = math.ceil((math.max((settingGracePeriod - 270), 0) / 3))

    if (modes[highestLevel] == INSANE) then
        settingMaxBurrows = math.max(settingMaxBurrows * 1.5, 50)
        chickenDebtCount = math.max(chickenDebtCount, 150)
    else
        settingMaxBurrows = settingMaxBurrows * math.floor(SetCount(humanTeams) * 1.334)
    end

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Game Rules
    --
    SetGameRulesParam("queenTime", settingQueenTime)
    SetGameRulesParam("gracePeriod", settingGracePeriod)
    SetGameRulesParam("difficulty", modes[luaAI] or 3)

    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    --
    -- Call-ins
    --

    function gadget:UnitIdle(unitID, unitDefID, unitTeam)
        -- filter out non chicken units
        if not computerTeams[unitTeam] then
            return
        end

        computerTeams[unitTeam]:UnitIdle(unitID, unitDefID)
    end

    function gadget:UnitCreated(unitID, unitDefID, unitTeam)
        -- filter out chicken units
        if computerTeams[unitTeam] then
            return
        end

        -- no human team? be save and return
        if not humanTeams[unitTeam] then
            return
        end

        humanTeams[unitTeam]:addUnit(unitID, unitDefID)
    end

    function gadget:UnitPreDamaged(
        unitID,
        unitDefID,
        unitTeam,
        damage,
        paralyzer,
        weaponID,
        projectileID,
        attackerID,
        attackerDefID,
        attackerTeam)

        -- either incrase damage
        if computerTeams[attackerTeam] then
            return damage * computerTeams[attackerTeam]:getDamageMod()
        end

        -- or decrease and store for KING resistance
        if computerTeams[unitTeam] then
            return computerTeams[unitTeam]:KingPreDamaged(unitID,
                                                          unitDefID,
                                                          unitTeam,
                                                          damage,
                                                          paralyzer,
                                                          weaponID,
                                                          projectileID,
                                                          attackerID,
                                                          attackerDefID,
                                                          attackerTeam)
        end
        return damage
    end

    function gadget:UnitDamaged(
        unitID,
        unitDefID,
        unitTeam,
        damage,
        paralyzer,
        weaponID,
        projectileID,
        attackerID,
        attackerDefID,
        attackerTeam)

        for _, robotTeam in pairs(computerTeams) do
            robotTeam:UnitDamaged(unitID,
                                  unitDefID,
                                  unitTeam,
                                  damage,
                                  paralyzer,
                                  weaponID,
                                  projectileID,
                                  attackerID,
                                  attackerDefID,
                                  attackerTeam)
        end
    end

    function gadget:GameStart()
        if noBotWarningMessage then
            Echo("Warning: No Chicken team available, add a Chicken bot")
            Echo("(Assigning Chicken Team to Gaia - AI: Custom)")
        end

        for _, robotTeam in pairs(computerTeams) do
            robotTeam:GameStart()
        end
    end

    function gadget:GameFrame(n)
        if gameOver then
            for teamID in pairs(computerTeams) do
                computerTeams[teamID]:updateUnitCount()
            end
            if (n > gameOver) then
                for teamID, _ in pairs(computerTeams) do
                    Spring.KillTeam(teamID)
                end
            end
            return
        end

        if n == 15 then
            -- Get rid of the AI
            for teamID in pairs(computerTeams) do
                local teamUnits = GetTeamUnits(teamID)
                for _, unitID in ipairs(teamUnits) do
                    Spring.MoveCtrl.Enable(unitID)
                    Spring.MoveCtrl.SetNoBlocking(unitID, true)
                    Spring.MoveCtrl.SetPosition(unitID, Game.mapSizeX + 500, 2000, Game.mapSizeZ + 500) --don't move too far out or prevent_aicraft_hax will explode it!
                    --Spring.SetUnitCloak(unitID, true)
                    Spring.SetUnitHealth(unitID, {paralyze = 99999999})
                    Spring.SetUnitNoDraw(unitID, true)
                    Spring.SetUnitStealth(unitID, true)
                    Spring.SetUnitNoSelect(unitID, true)
                    Spring.SetUnitNoMinimap(unitID, true)
                    Spring.GiveOrderToUnit(unitID, CMD.MOVE_STATE, {0}, {})
                    Spring.GiveOrderToUnit(unitID, CMD.FIRE_STATE, {0}, {})
                    disabledUnits[unitID] = true
                end
            end
        end

        for _, robotTeam in pairs(computerTeams) do
            robotTeam:GameFrame(n)
        end
    end

    function gadget:UnitDestroyed(unitID, unitDefID, unitTeam, attackerID)
        if not computerTeams[unitTeam] then
            -- Human team
            if not humanTeams[unitTeam] then
                -- also not human team bogus exit
                Echo("BOGUS not Robot Team and not Human Team")
                return
            end

            humanTeams[unitTeam]:removeUnit(unitID)

            -- no more work for human teams
            return
        end

        -- remove that robot from all teams
        for _, team in pairs(humanTeams) do
            if team:removeAttackingRobot(unitID) then
                break
            end
        end

        if not computerTeams[unitTeam] then
            Echo("BOGUS: Not a human team and not a robot team")
            return
        end

        computerTeams[unitTeam]:UnitDestroyed(unitID, unitDefID, attackerID)
    end

    function gadget:TeamDied(teamID)
        humanTeams[teamID] = nil

        computerTeams[teamID] = nil
    end

    function gadget:UnitTaken(unitID, unitDefID, oldTeam, newTeam)
        if computerTeams[oldTeam] then
            DestroyUnit(unitID, true)
        end
    end

    function gadget:AllowUnitTransfer(unitID, unitDefID, oldTeam, newTeam, capture)
        if computerTeams[newTeam] then
            return false
        end

        return true
    end

    function gadget:GameOver()
        if modes[highestLevel] ~= SURVIVAL then -- don't end game in survival mode
            gameOver = GetGameFrame()
        end
    end
else
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------
    -- END SYNCED
    -- BEGIN UNSYNCED
    --------------------------------------------------------------------------------
    --------------------------------------------------------------------------------

    local Script = Script
    local hasChickenEvent = false

    local function HasChickenEvent(ce)
        hasChickenEvent = (ec ~= "0")
    end

    function WrapToLuaUI(_, type, num, tech)
        if hasChickenEvent then
            local chickenEventArgs = {}
            if type ~= nil then
                chickenEventArgs["type"] = type
            end
            if num ~= nil then
                chickenEventArgs["number"] = num
            end
            if tech ~= nil then
                chickenEventArgs["tech"] = tech
            end
            Script.LuaUI.ChickenEvent(chickenEventArgs)
        end
    end

    function gadget:Initialize()
        gadgetHandler:AddSyncAction("ChickenEvent", WrapToLuaUI)
        gadgetHandler:AddChatAction("HasChickenEvent", HasChickenEvent, "toggles hasChickenEvent setting")
    end

    function gadget:Shutdown()
        gadgetHandler:RemoveChatAction("HasChickenEvent")
    end
end
-- END UNSYNCED
--------------------------------------------------------------------------------
