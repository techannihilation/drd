--------------------------------------------------------------------------------
--Robot Defense Config
--------------------------------------------------------------------------------

local GetModOptions =
  Spring.GetModOptions

settingMaxBurrows =
  20
settingBurrowhp =
  tonumber(
  GetModOptions(

  ).mo_custom_burrowshp
) or
  8600
settingGracePeriod =
  tonumber(
  GetModOptions(

  ).mo_graceperiod
) or
  160 -- no chicken spawn in this period, seconds
settingQueenTime =
  (GetModOptions(

).mo_queentime or
  40) *
  60 -- time at which the queen appears, seconds
settingAddQueenAnger =
  tonumber(
  GetModOptions(

  ).mo_queenanger
) or
  1
burrowSpawnType =
  GetModOptions(

).mo_chickenstart or
  "avoid"
settingAAUnits =
  GetModOptions(

).mo_aa_units or
  1
spawnSquare =
  90 -- size of the chicken spawn square centered on the burrow
spawnSquareIncrement =
  2 -- square size increase for each unit spawned
burrowName =
  "rroost" -- burrow unit name
settingMaxAge =
  tonumber(
  GetModOptions(

  ).mo_maxage
) or
  300 -- chicken die at this age, seconds
local mo_queendifficulty =
  GetModOptions(

)[
  "mo_queendifficulty"
] or
  "n_chickenq"
settingQueenName =
  mo_queendifficulty ..
  "r"
settingBurrowDef =
  UnitDefNames[
  burrowName
].id
defenderChance =
  0.5 -- probability of spawning a single turret
maxTurrets =
  3 -- Max Turrets per burrow
burrowSpawnRate =
  60
minBaseDistance =
  600
maxBaseDistance =
  7200
chickensPerPlayer =
  8
spawnChance =
  0.5
settingBonusTurret =
  "armrl" -- Turret that gets spawned when a burrow dies
angerBonus =
  0.25
expStep =
  0.0625
waves = {}
newWaveSquad = {}

bonusTurret5a =
  "armflak"
bonusTurret5b =
  "arm_big_bertha"
bonusTurret7a =
  "corpre"
bonusTurret7b =
  "armamd1"
bonusTurret7c =
  "cordoom"

settingCommanders = {
  --Core
  corcom = true,
  corcom1 = true,
  corcom3 = true,
  corcom5 = true,
  corcom6 = true,
  corcom7 = true,
  --Arm
  armcom = true,
  armcom1 = true,
  armcom2 = true,
  armcom3 = true,
  --The lost legacy
  tllcom = true,
  tllcom1 = true,
  tllcom2 = true,
  tllcom3 = true,
  --TALON
  talon_com = true,
  talon_com1 = true,
  talon_com2 = true,
  talon_com3 = true,
  --GOK
  gok_com = true,
  gok_com1 = true,
  gok_com2 = true,
  gok_com3 = true
}

settingNeutralUnits = {
  -- CORE
  corpunk = true,
  corak = true,
  corak1 = true,
  corfav = true,
  -- ARM
  armflea = true,
  armpw = true,
  armpw1 = true,
  armfav = true,
  armflash = true,
  -- TLL
  tllbug = true,
  tllprivate = true
}

VERYEASY =
  "Robot: Very Easy"
EASY =
  "Robot: Easy"
NORMAL =
  "Robot: Normal"
HARD =
  "Robot: Hard"
VERYHARD =
  "Robot: Very Hard"
INSANE =
  "Robot: Insane"
CUSTOM =
  "Robot: Custom"
SURVIVAL =
  "Robot: Survival"

settingModes = {
  [1] = VERYEASY,
  [2] = EASY,
  [3] = NORMAL,
  [4] = HARD,
  [5] = VERYHARD,
  [6] = INSANE,
  [7] = CUSTOM,
  [8] = SURVIVAL
}

for i, v in ipairs(
  settingModes
) do -- make it bi-directional
  settingModes[
      v
    ] =
    i
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local defenders = {
  armrl = true,
  armflak = true,
  arm_big_bertha = true,
  corpre = true,
  armamd1 = true,
  cordoom = true
}

settingForceGround = {
  abroadside = true,
  cdevastator = true,
  corvaliant = true,
  talon_skynet = true,
  talon_independence = true
}

settingBlackList = {
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
  -- not working
  nsaagriz = true,
  -- transports
  armatlas = true,
  armdlfy = true,
  armdragf = true,
  armor = true,
  armsl = true,
  armthovr = true,
  armtship = true,
  corfalc = true,
  cormuat = true,
  corthovr = true,
  cortship = true,
  corvalk = true,
  intruder = true,
  talon_bishop = true,
  talon_rukh = true,
  talon_tau = true,
  talon_wyvern = true,
  tllambassador = true,
  tllbtrans = true,
  tllrobber = true,
  tlltplane = true,
  -- Talon Mobile AntiNuke
  talon_tribulation = true,

  -- Can't target tnt
  armvader = true,
  coretnt = true,
  corroach = true,
  corsktl = true,
  gok_blackheart = true,
  talon_herison = true,
  talon_sphere = true,
  tllcrawlb = true,

  -- Useless for them
  armkrypto = true,
  gok_vtolmex = true,

  -- Satellite
  sat_radar = true,
  sat_interceptor = true,
	sat_strike = true,
	sat_antiair = true,
	armcsat = true,
	tllcsat = true,
	corcsat = true,
	talon_csat = true
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
if
  not settingAAUnits
 then
  for k in pairs(
    aaUnits
  ) do
    settingBlackList[
        k
      ] =
      true
  end
end

-- We have random all units, so make chickenType for all of them
local chickenTypes = {}
for _, ud in ipairs(
  UnitDefs
) do
  if
    not settingBlackList[
      ud.name
    ] and
      ud.isBuilder ==
        false and
      not settingCommanders[
        ud.name
      ]
   then
    chickenTypes[
        ud.name
      ] =
      true
  end
end

local function Copy(
  original)
  local copy = {}
  for k, v in pairs(
    original
  ) do
    if
      (type(
        v
      ) ==
        "table")
     then
      copy[
          k
        ] =
        Copy(
        v
      )
    else
      copy[
          k
        ] =
        v
    end
  end
  return copy
end

difficulties = {
  [VERYEASY] = {
    numWaves = 24,
    costMultiplier = 0.9,
    burrowSpawnRate = 120,
    kingMaxUnits = 0,
    angerBonus = 0.05,
    expStep = 0,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 0,
    maxRobots = 30,
    spawnChance = 45,
    damageMod = 0.6
  },
  [EASY] = {
    numWaves = 24,
    costMultiplier = 0.95,
    burrowSpawnRate = 120,
    kingMaxUnits = 3,
    angerBonus = 0.075,
    expStep = 0.09375,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 8,
    maxRobots = 40,
    spawnChance = 55,
    damageMod = 0.75
  },
  [NORMAL] = {
    numWaves = 30,
    costMultiplier = 1,
    burrowSpawnRate = 105,
    kingMaxUnits = 8,
    angerBonus = 0.10,
    expStep = 0.125,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 12,
    maxRobots = 60,
    spawnChance = 65,
    damageMod = 1
  },
  [HARD] = {
    numWaves = 34,
    costMultiplier = 1.05,
    burrowSpawnRate = 60,
    kingMaxUnits = 10,
    angerBonus = 0.125,
    expStep = 0.25,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 16,
    maxRobots = 65,
    spawnChance = 75,
    damageMod = 1.1
  },
  [VERYHARD] = {
    numWaves = 53,
    costMultiplier = 1.1,
    burrowSpawnRate = 40,
    kingMaxUnits = 12,
    angerBonus = 0.15,
    expStep = 0.4,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 20,
    maxRobots = 70,
    spawnChance = 80,
    damageMod = 1.25
  },
  [INSANE] = {
    numWaves = 80,
    costMultiplier = 1.2,
    burrowSpawnRate = 28,
    kingMaxUnits = 15,
    angerBonus = 0.20,
    expStep = 0.6,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 30,
    maxRobots = 80,
    spawnChance = 80,
    damageMod = 1.5
  },
  [CUSTOM] = {
    numWaves = tonumber(
      GetModOptions(

      ).mo_custom_numwaves
    or 80),
    costMultiplier = tonumber(
      GetModOptions(

      ).mo_custom_cost_multiplier
    or 1.2),
    burrowSpawnRate = tonumber(
      GetModOptions(

      ).mo_custom_burrowspawn
    or 28),
    kingMaxUnits = tonumber(
      GetModOptions(

      ).mo_custom_kingmaxunits
    or 15),
    angerBonus = tonumber(
      GetModOptions(

      ).mo_custom_angerbonus
    or 0.2),
    expStep = (tonumber(
      GetModOptions(

      ).mo_custom_expstep
    ) or
      0.6),
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = tonumber(
      GetModOptions(

      ).mo_custom_minchicken or
        30
    ),
    maxRobots = tonumber(
      GetModOptions(

      ).mo_custom_maxchicken or
        80
    ),
    spawnChance = (tonumber(
      GetModOptions(

      ).mo_custom_spawnchance
    ) or
      80),
    damageMod = (tonumber(
      GetModOptions(

      ).mo_custom_damagemod
    ) or
      1.5)
  },
  [SURVIVAL] = {
    numWaves = 80,
    costMultiplier = 1,
    burrowSpawnRate = 105,
    kingMaxUnits = 10,
    angerBonus = 25,
    expStep = 0.125,
    chickenTypes = Copy(
      chickenTypes
    ),
    defenders = Copy(
      defenders
    ),
    minRobots = 9,
    maxRobots = 60,
    spawnChance = 40,
    damageMod = 1
  }
}

settingDefaultDifficulty =
  "Robot: Normal"

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
-- New Waves Logic

-- settingWaves structure
-- [<% kingAnger>] = {
--   anger = <% of kinganger>
--   <class> = {
--      mincost = <min cost of unit>
--      maxcost = <max cost of unit * mo_custom_cost_multiplier>
--                <max cost of wave (num of wave units * this * mo_custom_cost_multiplier)>
--   }
-- }

settingWaves = {}
table.insert(
  settingWaves,
  {
    anger = 0,
    air = {
      mincost = 0,
      maxcost = 80
    }, -- CORE bladew
    air_fighter = {
      mincost = 0,
      maxcost = 0
    },
    ground = {
      mincost = 0,
      maxcost = 80
    }, -- TLL Private
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 5,
    air = {
      mincost = 0,
      maxcost = 80
    }, -- CORE BLADEW
    air_fighter = {
      mincost = 0,
      maxcost = 190
    }, -- TLL Sparrow
    ground = {
      mincost = 75,
      maxcost = 246
    }, -- ARM Stumpy
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 10,
    air = {
      mincost = 0,
      maxcost = 275
    }, -- TLL WASP
    air_fighter = {
      mincost = 0,
      maxcost = 190
    }, -- TLL Sparrow
    ground = {
      mincost = 75,
      maxcost = 246
    }, -- ARM Stumpy
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 20,
    air = {
      mincost = 80,
      maxcost = 275
    }, -- TLL WASP
    air_fighter = {
      mincost = 0,
      maxcost = 190
    }, -- TLL Sparrow
    ground = {
      mincost = 370,
      maxcost = 1963
    }, -- ARM Fatboy -- T2
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 30,
    air = {
      mincost = 276,
      maxcost = 683
    }, -- TLL GHOST
    air_fighter = {
      mincost = 0,
      maxcost = 476
    }, -- TLL Falcon
    ground = {
      mincost = 370,
      maxcost = 5673
    }, -- TLL Binder -- T2
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 40,
    air = {
      mincost = 276,
      maxcost = 683
    }, -- TLL GHOST
    air_fighter = {
      mincost = 0,
      maxcost = 190
    }, -- TLL Sparrow
    ground = {
      mincost = 1480,
      maxcost = 10000
    }, -- talon_visitant
    max_wavecost = 100
  }
)
table.insert(
  settingWaves,
  {
    anger = 50,
    air = {
      mincost = 276,
      maxcost = 683
    }, -- TLL GHOST
    air_fighter = {
      mincost = 191,
      maxcost = 476
    }, -- TLL Falcon
    ground = {
      mincost = 10000,
      maxcost = 20000
    }, -- CORE KrogTaar - T2.5
    max_wavecost = 50
  }
)
table.insert(
  settingWaves,
  {
    anger = 60,
    air = {
      mincost = 276,
      maxcost = 3942
    }, -- ARM LICHE
    air_fighter = {
      mincost = 191,
      maxcost = 476
    }, -- TLL Falcon
    ground = {
      mincost = 20000,
      maxcost = 40000
    }, -- ARM Vengence - T2.5
    max_wavecost = 40
  }
)
table.insert(
  settingWaves,
  {
    anger = 70,
    air = {
      mincost = 3942,
      maxcost = 7600
    }, -- CORE KROW
    air_fighter = {
      mincost = 191,
      maxcost = 476
    }, -- TLL Falcon
    ground = {
      mincost = 20000,
      maxcost = 108726.688
    }, -- TALON Silver
    max_wavecost = 40
  }
)
table.insert(
  settingWaves,
  {
    anger = 80,
    air = {
      mincost = 7600,
      maxcost = 17244
    }, -- TLL Aether
    air_fighter = {
      mincost = 477,
      maxcost = 1754
    }, -- TLL Shrike
    ground = {
      mincost = 108726.688,
      maxcost = 180000
    }, -- TLL Mini Hero
    max_wavecost = 30
  }
)
table.insert(
  settingWaves,
  {
    anger = 90,
    air = {
      mincost = 7600,
      maxcost = 17244
    }, -- TLL Aether
    air_fighter = {
      mincost = 1700,
      maxcost = 19000
    }, -- ARM Stratus
    ground = {
      mincost = 108726.688,
      maxcost = 257000
    }, -- CORE Super Krogoth
    max_wavecost = 20
  }
)
table.insert(
  settingWaves,
  {
    anger = 95,
    air = {
      mincost = 7600,
      maxcost = 17244
    }, -- TLL Aether
    air_fighter = {
      mincost = 1700,
      maxcost = 19000
    }, -- ARM Stratus
    ground = {
      mincost = 256999,
      maxcost = 1011695, -- TALON Independence, T5
    },
    max_wavecost = 10
  }
)
