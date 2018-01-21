--------------------------------------------------------------------------------
--Robot Defense Config
--------------------------------------------------------------------------------

local GetModOptions = Spring.GetModOptions

settingMaxBurrows    = 20
settingBurrowhp      = tonumber(GetModOptions().mo_custom_burrowshp) or 8600
settingGracePeriod   = tonumber(GetModOptions().mo_graceperiod) or 160  -- no chicken spawn in this period, seconds
settingQueenTime     = (GetModOptions().mo_queentime or 40) * 60 -- time at which the queen appears, seconds
settingAddQueenAnger = tonumber(GetModOptions().mo_queenanger) or 1
burrowSpawnType      = GetModOptions().mo_chickenstart or "avoid"
settingAAUnits       = GetModOptions().mo_aa_units or 1
spawnSquare          = 90       -- size of the chicken spawn square centered on the burrow
spawnSquareIncrement = 2         -- square size increase for each unit spawned
burrowName           = "rroost"   -- burrow unit name
settingMaxAge        = tonumber(GetModOptions().mo_maxage) or 300  -- chicken die at this age, seconds
local mo_queendifficulty   = GetModOptions()["mo_queendifficulty"] or "n_chickenq"
settingQueenName     = mo_queendifficulty .."r"
settingBurrowDef     = UnitDefNames[burrowName].id
defenderChance       = 0.5       -- probability of spawning a single turret
maxTurrets           = 3   		 -- Max Turrets per burrow
burrowSpawnRate      = 60
minBaseDistance      = 600
maxBaseDistance      = 7200
chickensPerPlayer    = 8
spawnChance          = 0.5
settingBonusTurret          = "armrl" -- Turret that gets spawned when a burrow dies
angerBonus           = 0.25
expStep              = 0.0625
waves                = {}
newWaveSquad         = {}

bonusTurret5a = "armflak"
bonusTurret5b = "arm_big_bertha"
bonusTurret7a = "corpre"
bonusTurret7b = "armamd1"
bonusTurret7c = "cordoom"

settingCommanders = {
  --Core
  "corcom",
  "corcom1",
  "corcom3",
  "corcom_fusion",
  "corcom5",
  "corcom6",
  "corcom7",
  --Arm
  "armcom",
  "armcom1",
  "armcom4",
  "armcom_fusion",
  "armcom5",
  "armcom6",
  "armcom7",
  --The lost legacy
  "tllcom",
  "tllcom1",
  "tllcom3",
  "tllcom_fusion",
  "tllcom5",
  "tllcom6",
  "tllcom7"
}

settingNeutralUnits = {
  -- CORE
  "corpunk",
  "corak",
  "corak1",
  "corfav",
  "correap",
  "corpyro",
  -- ARM
  "armflea",
  "armpw",
  "armpw1",
  "armfav",
  "armflash",
  "armlatnk",
  "armfast",
  -- TLL
  "tllbug",
  "tllprivate",
  "tllburner",
  "tllares",
  "tllcoyote"
}

settingModes = {
  [1] = VERYEASY,
  [2] = EASY,
  [3] = NORMAL,
  [4] = CUSTOM,
  [5] = SURVIVAL,
  [6] = HARD,
  [7] = VERYHARD,
  [8] = INSANE
}

for i, v in ipairs(settingModes) do -- make it bi-directional
  settingModes[v] = i
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local defenders = {
  armrl = true,
  armflak = true,
  arm_big_bertha = true,
  corpre = true,
  armamd1 = true,
  cordoom = true,
}

settingBlackList =
{
  armabad = true,
  armaser = true,
  armatlas = true,
  armawac = true,
  armclaw = true,
  armdfly = true,
  armiguana = true,
  armjam = true,
  armlance = true,
  armmark = true,
  armorbweaver = true,
  armpeep = true,
  armscab = true,
  armscab1 = true,
  armseap = true,
  armseer = true,
  armsehak = true,
  armsfig = true,
  armsh175 = true,
  armsl = true,
  armspy = true,
  blotter = true,
  concealer = true,
  corawac = true,
  corbtrans = true,
  coreter = true,
  corfalc = true,
  corfink = true,
  corhelo = true,
  corhunt = true,
  cormabm = true,
  cormabm1 = true,
  cormaw = true,
  corseap = true,
  corsfig = true,
  corshieldgen = true,
  corspec = true,
  corspy = true,
  cortitan = true,
  corvalk = true,
  corvoyr = true,
  corvrad = true,
  e_chickenqr = true,
  fh_chickenqr = true,
  h_chickenqr = true,
  intruder = true,
  n_chickenqr = true,
  nsacanglr = true,
  r75v = true,
  requ1 = true,
  rroost = true,
  tllconfuser = true,
  tlldivine = true,
  tllfflak = true,
  tllhickatee = true,
  tllleatherback = true,
  tllobscurer = true,
  tllobserver = true,
  tllprob = true,
  tllrobber = true,
  tllrsplane = true,
  tllseab = true,
  tllseaf = true,
  tllsoftshell = true,
  tllsonpl = true,
  tllspy = true,
  tlltorpp = true,
  tlltplane = true,
  tllturtle = true,
  ve_chickenqr = true,
  vh_chickenqr = true,
  watcher = true,
}

local aaUnits = {
  -- ARM AA Units
  ahermes = true,
  armjeth = true,
  armyork = true,
  armaak = true,
  armeak = true,
  armah = true,
  armhuntsman = true,

  -- CORE AA Units
  corcrash = true,
  corjeag = true,
  coraak = true,
  corsent = true,
  coreak = true,
  corah = true,
  coreslingshot = true,
  corfrog = true,

  -- TLL AA Units
  tllhoplit = true,
  tllfirestarter = true,
  tllaak = true,
  tllpuncher = true,
  tllhovermissile = true,
  tllloggerhead = true,
  tllsideneck = true
}

-- implemention of mo_aa_units
if not settingAAUnits then
  for k in pairs(aaUnits) do
    settingBlackList[k] = true
  end
end

-- We have random all units, so make chickenType for all of them
local chickenTypes = {}
for _, ud in ipairs(UnitDefs) do
  chickenTypes[ud.name] = true
end

VERYEASY = "Robot: Very Easy"
EASY = "Robot: Easy"
NORMAL = "Robot: Normal"
HARD = "Robot: Hard"
VERYHARD = "Robot: Very Hard"
INSANE = "Robot: Insane"
CUSTOM = "Robot: Custom"
SURVIVAL = "Robot: Survival"


local function Copy(original)
  local copy = {}
  for k, v in pairs(original) do
    if (type(v) == "table") then
      copy[k] = Copy(v)
    else
      copy[k] = v
    end
  end
  return copy
end


difficulties = {
  [VERYEASY] = {
    numWaves          = 24,
    costMultiplier    = 0.9,
    burrowSpawnRate   = 120,
    kingMaxUnits      = 0,
    angerBonus        = 0.05,
    expStep           = 0,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 3,
    maxRobotsPPlayer  = 30,
    spawnChance       = 45,
    damageMod         = 0.6,
  },
  [EASY] = {
    numWaves          = 24,
    costMultiplier    = 0.95,
    burrowSpawnRate   = 120,
    kingMaxUnits      = 3,
    angerBonus        = 0.075,
    expStep           = 0.09375,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 5,
    maxRobotsPPlayer  = 45,
    spawnChance       = 55,
    damageMod         = 0.75,
  },

  [NORMAL] = {
    numWaves          = 30,
    costMultiplier    = 1,
    burrowSpawnRate   = 105,
    kingMaxUnits      = 8,
    angerBonus        = 0.10,
    expStep           = 0.125,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 8,
    maxRobotsPPlayer  = 60,
    spawnChance       = 65,
    damageMod         = 1,
  },

  [HARD] = {
    numWaves          = 34,
    costMultiplier    = 1.05,
    burrowSpawnRate   = 60,
    kingMaxUnits      = 10,
    angerBonus        = 0.125,
    expStep           = 0.25,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 12,
    maxRobotsPPlayer  = 60,
    spawnChance       = 75,
    damageMod         = 1.1,
  },


  [VERYHARD] = {
    numWaves          = 53,
    costMultiplier    = 1.1,
    burrowSpawnRate   = 40,
    kingMaxUnits      = 12,
    angerBonus        = 0.15,
    expStep           = 0.4,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 18,
    maxRobotsPPlayer  = 75,
    spawnChance       = 85,
    damageMod         = 1.25,
  },

  [INSANE] = {
    numWaves          = 80,
    costMultiplier    = 1.2,
    burrowSpawnRate   = 28,
    kingMaxUnits      = 15,
    angerBonus        = 0.20,
    expStep           = 0.6,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = 26,
    maxRobotsPPlayer  = 90,
    spawnChance       = 95,
    damageMod         = 1.5,
  },


  [CUSTOM] = {
    numWaves          = tonumber(GetModOptions().mo_custom_numwaves),
    costMultiplier    = tonumber(GetModOptions().mo_custom_cost_multiplier),
    burrowSpawnRate   = tonumber(GetModOptions().mo_custom_burrowspawn),
    kingMaxUnits      = tonumber(GetModOptions().mo_custom_kingmaxunits),
    angerBonus        = tonumber(GetModOptions().mo_custom_angerbonus),
    expStep           = (tonumber(GetModOptions().mo_custom_expstep) or 0.6) * -1,
    chickenTypes      = Copy(chickenTypes),
    defenders         = Copy(defenders),
    minRobotsPPlayer  = tonumber(GetModOptions().mo_custom_minchicken or 8),
    maxRobotsPPlayer  = tonumber(GetModOptions().mo_custom_maxchicken or 60),
    spawnChance       = (tonumber(GetModOptions().mo_custom_spawnchance) or 40),
    damageMod         = (tonumber(GetModOptions().mo_custom_damagemod) or 100) / 100,
  },

  [SURVIVAL] = {
    numWaves            = 80,
    costMultiplier      = 1,
    burrowSpawnRate     = 105,
    kingMaxUnits        = 10,
    angerBonus          = 25,
    expStep             = 0.125,
    chickenTypes        = Copy(chickenTypes),
    defenders           = Copy(defenders),
    minRobotsPPlayer    = 9,
    maxRobotsPPlayer    = 60,
    spawnChance         = 40,
    damageMod           = 1,
  },
}



settingDefaultDifficulty = 'Robot: Normal'

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- New Waves Logic

-- settingWaves structure
-- [<% kingAnger>] = {
--   anger = <% of kinganger>
--   <class> = {
--      maxtl   = <max tech level of unit - if cost multiplier > 1.4 then its +2>
--      mincost = <min cost of unit>
--      maxcost = <max cost of unit * mo_custom_cost_multiplier>
--                <max cost of wave (num of wave units * this * mo_custom_cost_multiplier)>
--   }
-- }

settingWaves = {}
table.insert(settingWaves, {
  anger = 0,
  air = { maxtl = 2, mincost = 0, maxcost = 80 }, -- CORE bladew
  air_fighter = { maxtl = 0, mincost = 0, maxcost = 0 },
  ground = { maxtl = 2, mincost = 0, maxcost = 74 }, -- TLL Private
})
table.insert(settingWaves, {
  anger = 5,
  air = { maxtl = 2, mincost = 0, maxcost = 80 }, -- CORE BLADEW
  air_fighter = { maxtl = 2, mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { maxtl = 2, mincost = 75, maxcost = 246 }, -- ARM Stumpy
})
table.insert(settingWaves, {
  anger = 10,
  air = { maxtl = 2, mincost = 0, maxcost = 275 }, -- TLL WASP
  air_fighter = { maxtl = 2, mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { maxtl = 2, mincost = 75, maxcost = 246 }, -- ARM Stumpy
})
table.insert(settingWaves, {
  anger = 20,
  air = { maxtl = 2, mincost = 80, maxcost = 275 }, -- TLL WASP
  air_fighter = { maxtl = 2, mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { maxtl = 2, mincost = 370, maxcost = 1963 }, -- ARM Fatboy -- T2
})
table.insert(settingWaves, {
  anger = 30,
  air = { maxtl = 4, mincost = 276, maxcost = 683 }, -- TLL GHOST
  air_fighter = { maxtl = 4, mincost = 0, maxcost = 476 }, -- TLL Falcon
  ground = { maxtl = 4, mincost = 370, maxcost = 3175 }, -- TLL Binder -- T2
})
table.insert(settingWaves, {
  anger = 40,
  air = { maxtl = 4, mincost = 276, maxcost = 683 }, -- TLL GHOST
  air_fighter = { maxtl = 4, mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { maxtl = 4, mincost = 1480, maxcost = 3371 }, -- CORE Demon T2.5
})
table.insert(settingWaves, {
  anger = 50,
  air = { maxtl = 4, mincost = 276, maxcost = 683 }, -- TLL GHOST
  air_fighter = { maxtl = 4, mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { maxtl = 4, mincost = 1481, maxcost = 7399 }, -- CORE KrogTaar - T2.5
})
table.insert(settingWaves, {
  anger = 60,
  air = { maxtl = 4, mincost = 276, maxcost = 3942 }, -- ARM LICHE
  air_fighter = { maxtl = 4, mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { maxtl = 4, mincost = 7398, maxcost = 10120 }, -- ARM Vengence - T2.5
})
table.insert(settingWaves, {
  anger = 70,
  air = { maxtl = 4, mincost = 3942, maxcost = 7600 }, -- CORE KROW
  air_fighter = { maxtl = 4, mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { maxtl = 6, mincost = 10120, maxcost = 21334 }, -- TLL Bubmlebee, T3
})
table.insert(settingWaves, {
  anger = 80,
  air = { maxtl = 4, mincost = 3942, maxcost = 7600 }, -- CORE KROW
  air_fighter = { maxtl = 6, mincost = 477, maxcost = 1754 }, -- TLL Shrike
  ground = { maxtl = 6, mincost = 21334, maxcost = 46000 }, -- ARM Furie, T3.5
})
table.insert(settingWaves, {
  anger = 90,
  air = { maxtl = 6, mincost = 3942, maxcost = 17244 }, -- TLL Aether
  air_fighter = { maxtl = 6, mincost = 477, maxcost = 1754 }, -- TLL Shrike
  ground = { maxtl = 8, mincost = 46000, maxcost = 256171 }, -- CORE Super Krogoth, T5
})
table.insert(settingWaves, {
  anger = 95,
  air = { maxtl = 8, mincost = 3942, maxcost = 17244 }, -- TLL Aether
  air_fighter = { maxtl = 8, mincost = 477, maxcost = 1754 }, -- TLL Shrike
  ground = { maxtl = 8, mincost = 46000, maxcost = 332667 }, -- CORE DEVASTATOR, T5
})