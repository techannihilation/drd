--------------------------------------------------------------------------------
--Robot Defense Config
--------------------------------------------------------------------------------

local GetModOptions = Spring.GetModOptions

settingMaxChicken    = tonumber(GetModOptions().mo_maxchicken) or 400
settingMaxBurrows    = 20
settingBurrowhp      = tonumber(GetModOptions().mo_custom_burrowshp) or 8600
settingGracePeriod   = tonumber(GetModOptions().mo_graceperiod) or 160  -- no chicken spawn in this period, seconds
settingQueenTime     = (GetModOptions().mo_queentime or 40) * 60 -- time at which the queen appears, seconds
settingAddQueenAnger = tonumber(GetModOptions().mo_queenanger) or 1
burrowSpawnType      = GetModOptions().mo_chickenstart or "avoid"
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
  ahermes = true,
  armaak = true,
  armabad = true,
  armah = true,
  armaser = true,
  armatlas = true,
  armawac = true,
  armclaw = true,
  armdfly = true,
  armeak = true,
  armfig = true,
  armfig = true,
  armhuntsman = true,
  armiguana = true,
  armjam = true,
  armjeth = true,
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
  armyork = true,
  blotter = true,
  concealer = true,
  coraak = true,
  corah = true,
  corawac = true,
  corbtrans = true,
  corcrash = true,
  coreak = true,
  coreslingshot = true,
  coreter = true,
  corfalc = true,
  corfink = true,
  corfrog = true,
  corhelo = true,
  corhunt = true,
  corjeag = true,
  cormabm = true,
  cormabm1 = true,
  cormaw = true,
  corseap = true,
  corsent = true,
  corsfig = true,
  corshieldgen = true,
  corspec = true,
  corspy = true,
  cortitan = true,
  corvalk = true,
  corvamp = true,
  corveng = true,
  corvoyr = true,
  corvrad = true,
  e_chickenq = true,
  e_chickenqr = true,
  epic_chickenq = true,
  fh_chickenq = true,
  fh_chickenqr = true,
  h_chickenq = true,
  h_chickenqr = true,
  intruder = true,
  n_chickenq = true,
  n_chickenqr = true,
  nsaagriz = true,
  nsacanglr = true,
  r75v = true,
  requ1 = true,
  roost = true,
  rroost = true,
  tllaak = true,
  tllacid = true,
  tllconfuser = true,
  tlldivine = true,
  tllfflak = true,
  tllfight = true,
  tllfirestarter = true,
  tllhickatee = true,
  tllhoplit = true,
  tllhovermissile = true,
  tllleatherback = true,
  tllloggerhead = true,
  tllobscurer = true,
  tllobserver = true,
  tllprob = true,
  tllpuncher = true,
  tllrobber = true,
  tllrsplane = true,
  tllseab = true,
  tllseaf = true,
  tllshu = true,
  tllsideneck = true,
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

local chickenTypes = {
  ve_chickenqr  =  true,
  e_chickenqr   =  true,
  n_chickenqr   =  true,
  h_chickenqr   =  true,
  vh_chickenqr  =  true,
  fh_chickenqr  =  true,
  corcrash      =  true,
  armflea       =  true,
  armflash      =  true,
  armflash1     =  true,
  armsam        =  true,
  armsam1       =  true,
  cormist       =  true,
  cormist1      =  true,
  corthud       =  true,
  corthud1      =  true,
  ahermes       =  true,
  armstump      =  true,
  armthund      =  true,
  armblz        =  true,
  corhurc       =  true,
  armjanus1     =  true,
  tllloggerhead =  true,
  corgol        =  true,
  armraven1     =  true, --piece count 16
  armshock1     =  true,
  armsnipe      =  true,
  taipan        =  true,
  armmerl       =  true,
  tankanotor    =  true,
  airwolf3g     =  true,
  armcybr       =  true,
  corpyro       =  true, --piece count 17
  krogtaar      =  true, --piece count 13
  corprot       =  true, --piece count 26
  cortotal      =  true, --piece count 6
  armraven      =  true, --piece count 16
  corkrog       =  true, --piece count 21
  arm_furie     =  true, --piece count 18
  corkarg       =  true, --piece count 33
  corkarg1      =  true, --piece count 33
  corgala       =  true, --piece count 20
  armcrabe      =  true, --piece count 10
  trem          =  true,
  clb           =  true,
  armzeus       =  true,
  armzeus1      =  true,
  armhdpw       =  true,
  armbull       =  true,
  cordem        =  true, --piece count 23
  tllgrim       =  true, --piece count 24
  aexxec        =  true, --piece count 8
  corsumo       =  true, --piece count 16
  corsumo1      =  true, --piece count 16
  corhrk        =  true, --piece count 9
  armfboy       =  true, --piece count 10
  cormort       =  true,
  corcrw        =  true,
  armcyclone    =  true,
  armfast       =  true,
  gorg          =  true, --piece count 23
  armtigre2     =  true, --piece count 18
  armtarantula  =  true,
  armsonic      =  true,
  cormonsta     =  true, --piece count 12
  armpraet      =  true, --piece count 17
  armjag        =  true, --piece count 27
  corspec       =  true,
  tllmatamata   =  true,
  anvil         =  true, --piece count 4
  hyperion      =  true, --piece count 28
  armorion      =  true, --piece count 3
  corrag        =  true,
  armmart       =  true,
  shiva         =  true,
  --new
  marauder      =  true, --piece count 15
  heavyimpact   =  true, --piece count 17
  tllblind      =  true, --piece count 13
  tllvaliant    =  true, --piece count 22
  abroadside    =  true, --piece count 25
  tlllongshot   =  true, --piece count 5
  tllcrawlb     =  true,
  airwolf3g     =  true,

  --new by skymyj
  tllamphibot   = true, -- piece count 5
  coramph       = true, -- piece count 5
  cormddm       = true, -- piece count 10
  tlldemon      = true, -- piece count 15
  tllhailstorm  = true, -- piece count 20
  tllcopter     = true, -- piece count 5
  tllaether     = true, -- piece count 10
  armtem        = true, -- piece count 10 --T2.5 Hover
  coradon       = true, -- piece count 10 --T2.5 Hover
  cortotal      = true, -- piece count 10
  krogtaar      = true, -- piece count 15
  akmech        = true, -- piece count 15

  --added only for insane king spawn
  abroadside    =  true,
  cdevastator   =  true,
  monkeylord    =  true,
  irritator     =  true,
}

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
    chickensPerPlayer = 3,
    spawnChance       = 0.25,
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
    chickensPerPlayer = 5,
    spawnChance       = 0.33,
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
    chickensPerPlayer = 7,
    spawnChance       = 0.4,
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
    chickensPerPlayer = 12,
    spawnChance       = 0.5,
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
    chickensPerPlayer = 18,
    spawnChance       = 0.6,
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
    chickensPerPlayer = 26,
    spawnChance       = 0.8,
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
    chickensPerPlayer = tonumber(GetModOptions().mo_custom_minchicken),
    spawnChance       = (tonumber(GetModOptions().mo_custom_spawnchance) or 50) / 100,
    damageMod         = (tonumber(GetModOptions().mo_custom_damagemod) or 100) / 100,
  },

  [SURVIVAL] = {
    numWaves            = 80,
    costMultiplier      = 1.2,
    burrowSpawnRate     = 105,
    kingMaxUnits        = 10,
    angerBonus          = 25,
    expStep             = 0.125,
    chickenTypes        = Copy(chickenTypes),
    defenders           = Copy(defenders),
    chickensPerPlayer   = 9,
    spawnChance         = 0.4,
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
--   <class> = { maxcost = <max cost of wave (num of wave units * this * mo_custom_cost_multiplier)> }
-- }

settingWaves = {}
table.insert(settingWaves, {
  anger = 0,
  air = { mincost = 0, maxcost = 80 }, -- CORE bladew
  air_fighter = { mincost = 0, maxcost = 0 },
  ground = { mincost = 0, maxcost = 74 }, -- TLL Private
})
table.insert(settingWaves, {
  anger = 10,
  air = { mincost = 0, maxcost = 80 }, -- CORE BLADEW
  air_fighter = { mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { mincost = 75, maxcost = 246 }, -- ARM Stumpy
})

-- WIP START
table.insert(settingWaves, {
  anger = 20,
  air = { mincost = 80, maxcost = 275 }, -- TLL WASP
  air_fighter = { mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { mincost = 75, maxcost = 1480 }, -- ARM Century
})
table.insert(settingWaves, {
  anger = 30,
  air = { mincost = 80, maxcost = 275 }, -- TLL WASP
  air_fighter = { mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { mincost = 75, maxcost = 1480 }, -- ARM Century
})
table.insert(settingWaves, {
  anger = 40,
  air = { mincost = 80, maxcost = 275 }, -- TLL WASP
  air_fighter = { mincost = 0, maxcost = 190 }, -- TLL Sparrow
  ground = { mincost = 75, maxcost = 1480 }, -- ARM Century
})
-- WIP END

table.insert(settingWaves, {
  anger = 50,
  air = { mincost = 0, maxcost = 80 }, -- CORE BLADEW
  air_fighter = { mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { mincost = 1481, maxcost = 7399 }, -- CORE KrogTaar
})
table.insert(settingWaves, {
  anger = 60,
  air = { mincost = 0, maxcost = 80 }, -- CORE BLADEW
  air_fighter = { mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { mincost = 7398, maxcost = 10121 }, -- ARM Vengence
})
table.insert(settingWaves, {
  anger = 70,
  air = { mincost = 0, maxcost = 3942 }, -- ARM LICHE
  air_fighter = { mincost = 191, maxcost = 476 }, -- TLL Falcon
  ground = { mincost = 10121, maxcost = 21001 }, -- ARM CAV
})
table.insert(settingWaves, {
  anger = 80,
  air = { mincost = 3942, maxcost = 7600 }, -- CORE KROW
  air_fighter = { mincost = 477, maxcost = 1754 }, -- TLL Shrike
  ground = { mincost = 10121, maxcost = 46000 }, -- ARM Furie
})
table.insert(settingWaves, {
  anger = 90,
  air = { mincost = 3942, maxcost = 17244 }, -- TLL Aether
  air_fighter = { mincost = 0, maxcost = 1754 }, -- TLL Shrike
  ground = { mincost = 46000, maxcost = 256171 }, -- CORE Super Krogoth
})
table.insert(settingWaves, {
  anger = 95,
  air = { mincost = 3942, maxcost = 17244 }, -- TLL Aether
  air_fighter = { mincost = 0, maxcost = 1754 }, -- TLL Shrike
  ground = { mincost = 46000, maxcost = 332667 }, -- CORE DEVASTATOR
})