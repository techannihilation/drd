--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Robot Spawner",
    desc      = "Spawns Enemies",
    author    = "",
    date      = "28 October, 2017",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = false --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
if (gadgetHandler:IsSyncedCode()) then
-- BEGIN SYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
--
-- Speed-ups
--
local GetUnitDefID = Spring.GetUnitDefID
local GetUnitPosition = Spring.GetUnitPosition
local GetUnitTeam =  Spring.GetUnitTeam
local MarkerAddPoint = Spring.MarkerAddPoint
local MarkerErasePosition = Spring.MarkerErasePosition
local GetTeamList = Spring.GetTeamList
local GetTeamLuaAI = Spring.GetTeamLuaAI
local echo = Spring.Echo

local humanTeams = {}
local computerTeams = {}

local modes = {
    [1] = EASY,
    [2] = NORMAL,
    [3] = HARD,
    [4] = VERYHARD,
}

local player = {}
local players ={}
player.__index = player

function gadget:Initialize()
	getTeams()
end

function getTeams()
	for i, v in ipairs(modes) do -- make it bi-directional
	    modes[v] = i
	end
	local teams = GetTeamList()
	 local highestLevel = 0
	 local pn = 0
	 for _, teamID in ipairs(teams) do
	     local teamLuaAI = GetTeamLuaAI(teamID)
	     if (teamLuaAI and teamLuaAI ~= "") then
	         luaAI = teamLuaAI
	         if (modes[teamLuaAI] > highestLevel) then
	             highestLevel = modes[teamLuaAI]
	         end
	         RobotTeamID = teamID
	         computerTeams[teamID] = true
	     else
	         humanTeams[teamID] = true
	         pn = pn +1
	         players[pn] = player.new(0)
	     end
	 end
end

function player.new(teamID)
	return setmetatable(
		{teamID = teamID, eResources = 0, eBuildings = {}, targets = {}}, 
		player)
end

function player:addBuilding(unitID)
	if self.teamID == GetUnitTeam(unitID) then
		local x,y,z = GetUnitPosition(unitID)
		local pos = {x=x,y=y,z=z}
		local unitDefID = GetUnitDefID(unitID)
		self.eBuildings[unitID] = {energyMake = UnitDefs[unitDefID].energyMake,pos = pos}
	end
end

function player:removeBuilding(unitID)
	if self.teamID == GetUnitTeam(unitID) then
		self.eBuildings[unitID] = nil
	end
end

function player:updateResources()
		self.eResources = 0
		for unitID,parms in pairs(self.eBuildings) do
			self.eResources = self.eResources + parms.energyMake
		end
end

function player:updateTargets()
	local last = 0
	for unitID,parms in pairs(self.eBuildings) do
		if last == 0 then last = parms.energyMake end
		if last == parms.energyMake then
			self.targets[unitID] = true
		end
		if parms.energyMake > last then
			self.targets = {}
			self.targets[unitID] = true
			last = parms.energyMake
		end
	end
end

function gadget:UnitDestroyed(unitID, unitDefID, teamID, attackerID, attackerDefID, attackerTeamID)
	if humanTeams[teamID] then
		if UnitDefs[unitDefID].energyMake > 50 and (not UnitDefs[unitDefID].moveDef.name) then
			for n, player in pairs(players) do
				players[n]:removeBuilding(unitID)
				players[n].targets[unitID] = nil
				players[n]:updateTargets()
				players[n]:updateResources()
				echo("Player "..player.teamID.." Resources= "..players[n].eResources)
			end
		end
	end
end

function gadget:UnitCreated(unitID, unitDefID, unitTeam, builderID)
	if humanTeams[unitTeam] then
		if UnitDefs[unitDefID].energyMake > 50 and (not UnitDefs[unitDefID].moveDef.name) then
			for n, player in pairs(players) do
				players[n]:addBuilding(unitID)
				players[n]:updateTargets(unitID)
				players[n]:updateResources()
				echo("Player "..player.teamID.." Resources= "..players[n].eResources)
			end
		end
	end
end

function gadget:GameFrame(f)
	if (f%15) then
		for n, player in pairs(players) do
			for unitID in pairs(player.targets) do
				echo(unitID)
			end
		end
	end
end

else
-- END SYNCED
-- BEGIN UNSYNCED
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:Initialize()
end

function gadget:Shutdown()
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
end
-- END UNSYNCED
--------------------------------------------------------------------------------
