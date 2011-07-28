-- UNITDEF -- TLLSEAF --
--------------------------------------------------------------------------------

local unitName = "tllseaf"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.6,
  amphibious         = 1,
  badTargetCategory  = [[NOTAIR]],
  bmcode             = 1,
  brakeRate          = 4.2,
  buildCostEnergy    = 6420,
  buildCostMetal     = 192,
  builder            = false,
  buildTime          = 14731,
  canAttack          = true,
  canFly             = true,
  canGuard           = true,
  canMove            = true,
  canPatrol          = true,
  canstop            = 1,
  canSubmerge        = true,
  category           = [[TLL NOTLAND MOBILE WEAPON ANTIGATOR NOTSUB ANTIFLAME ANTIEMG ANTILASER VTOL NOTSHIP]],
  collide            = false,
  copyright          = [[Copyright 1997 Humongous Entertainment. All rights reserved.]],
  cruiseAlt          = 75,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Seaplane Fighter]],
  designation        = [[TL-SEAF]],
  downloadable       = 1,
  energyMake         = 1,
  energyUse          = 1,
  explodeAs          = [[SMALL_UNITEX]],
  firestandorders    = 1,
  footprintX         = 3,
  footprintZ         = 3,
  frenchdescription  = [[Hydravion de Chasse]],
  germandescription  = [[J�ger-Wasserflugzeug]],
  italiandescription = [[Caccia idrovolante]],
  maneuverleashlength = 1280,
  maxDamage          = 154,
  maxSlope           = 10,
  maxVelocity        = 12.3,
  maxWaterDepth      = 255,
  mobilestandorders  = 1,
  moverate1          = 8,
  name               = [[Gull]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTAIR]],
  objectName         = [[TLLSEAF]],
  radarDistance      = 0,
  selfDestructAs     = [[SMALL_UNIT]],
  shootme            = 1,
  side               = [[TLL]],
  sightDistance      = 350,
  spanishdescription = [[Hidroavi�n de Combate]],
  standingfireorder  = 2,
  standingmoveorder  = 2,
  steeringmode       = 1,
  threed             = 1,
  turnRate           = 512,
  unitname           = [[tllseaf]],
  unitnumber         = 919,
  version            = 1,
  workerTime         = 0,
  zbuffer            = 1,
  sounds = {
    build              = [[nanlath1]],
    canceldestruct     = [[cancel2]],
    repair             = [[repair1]],
    underattack        = [[warning1]],
    working            = [[reclaim1]],
    cant = {
      [[cantdo4]],
    },
    count = {
      [[count6]],
      [[count5]],
      [[count4]],
      [[count3]],
      [[count2]],
      [[count1]],
    },
    ok = {
      [[vtolcrmv]],
    },
    select = {
      [[seapsel1]],
    },
  },
  weapons = {
    [1]  = {
      def                = [[ARMSFIG_WEAPON]],
    },
    [2]  = {
      def                = [[TLLVTOL_MISSILE]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  ARMSFIG_WEAPON = {
    areaOfEffect       = 48,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:FLASH2]],
    fireStarter        = 70,
    guidance           = true,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[missile]],
    name               = [[GuidedMissiles]],
    noSelfDamage       = true,
    range              = 550,
    reloadtime         = 0.85,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = 0.1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[Rocklit3]],
    startsmoke         = 1,
    startVelocity      = 420,
    texture2           = [[armsmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 19384,
    weaponAcceleration = 146,
    weaponTimer        = 6,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 522,
    damage = {
      commanders         = 5,
      default            = 12,
      gunships           = 150,
      hgunships          = 200,
      l1bombers          = 210,
      l1fighters         = 120,
      l1subs             = 3,
      l2bombers          = 210,
      l2fighters         = 90,
      l2subs             = 3,
      l3subs             = 3,
      vradar             = 100,
      vtol               = 100,
      vtrans             = 100,
    },
  },
  TLLVTOL_MISSILE = {
    areaOfEffect       = 48,
    collideFriendly    = false,
    craterBoost        = 0,
    craterMult         = 0,
    explosionart       = [[explode3]],
    explosiongaf       = [[fx]],
    fireStarter        = 70,
    guidance           = true,
    id                 = 134,
    impulseBoost       = 0.123,
    impulseFactor      = 0.123,
    lavaexplosionart   = [[lavasplash]],
    lavaexplosiongaf   = [[fx]],
    lineOfSight        = true,
    metalpershot       = 0,
    model              = [[tllvtolmissile]],
    name               = [[Guided Missiles]],
    noSelfDamage       = true,
    range              = 530,
    reloadtime         = 1,
    renderType         = 1,
    selfprop           = true,
    smokedelay         = .1,
    smokeTrail         = true,
    soundHit           = [[xplosml2]],
    soundStart         = [[Rocklit3]],
    startVelocity      = 420,
    texture2           = [[armsmoketrail]],
    tolerance          = 8000,
    tracks             = true,
    turnRate           = 16384,
    waterexplosionart  = [[h2o]],
    waterexplosiongaf  = [[fx]],
    weaponAcceleration = 146,
    weaponTimer        = 5,
    weaponType         = [[MissileLauncher]],
    weaponVelocity     = 480,
    damage = {
      commanders         = 1,
      default            = 0.001,
      gunships           = 90,
      hgunships          = 80,
      l1bombers          = 240,
      l1fighters         = 87,
      l1subs             = 5,
      l2bombers          = 160,
      l2fighters         = 20,
      l2subs             = 5,
      l3subs             = 5,
      vradar             = 50,
      vtol               = 50,
      vtrans             = 70,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
