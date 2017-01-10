-- UNITDEF -- CHICKEN2B --
--------------------------------------------------------------------------------

local unitName = "chicken2b"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.69999998807907,
  autoHeal           = 20,
  bmcode             = 1,
  brakeRate          = 45,
  buildCostEnergy    = 1000,
  buildCostMetal     = 150,
  builder            = false,
  buildTime          = 7000,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 1,
  category           = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
  collisionvolumeoffsets = [[0 -1 0]],
  collisionvolumescales = [[20 29 44]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Apex Swarmer]],
  explodeAs          = [[BUG_DEATH]],
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[chicken]],
  leaveTracks        = false,
  maneuverleashlength = 640,
  mass               = 600,
  maxDamage          = 3600,
  maxSlope           = 18,
  maxVelocity        = 5.5999999046326,
  maxWaterDepth      = 15,
  movementClass      = [[AKBOT2]],
  name               = [[Chicken]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chicken2b.s3o]],
  seismicSignature   = 0,
  selfDestructAs     = [[BUG_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 375,
  smoothAnim         = false,
  steeringmode       = 2,
  trackOffset        = 0,
  trackStrength      = 8,
  trackStretch       = 1,
  trackType          = [[ChickenTrack]],
  trackWidth         = 18,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 3.6960000991821,
  turnRate           = 800,
  unitname           = [[chicken2b]],
  upright            = false,
  waterline          = 8,
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 3126.5068359375,
      description        = [[Chicken Wreckage]],
      filename           = [[units/chicken2b.lua]],
      metal              = 112.5,
    },
    heap = {
      filename           = [[units/chicken2b.lua]],
    },
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:blood_spray]],
      [[custom:blood_explode]],
      [[custom:dirt]],
    },
  },
  weapondefs = {
   weapon = {
      areaofeffect       = 32,
      avoidfeature       = [[false]],
      avoidfriendly      = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      explosiongenerator = [[custom:NONE]],
      impulseboost       = 2.2000000476837,
      impulsefactor      = 1,
      interceptedbyshieldtype = 0,
      name               = [[Claws]],
      noselfdamage       = [[false]],
      range              = 115,
      reloadtime         = 0.5,
      size               = 0,
      soundhitwet        = [[splshbig]],
      soundhitwetvolume  = 0.60000002384186,
      soundstart         = [[smallchickenattack]],
      targetborder       = 1,
      tolerance          = 5000,
      turret             = [[false]],
      waterweapon        = [[false]],
      weapontimer        = 0.10000000149012,
      weapontype         = [[Cannon]],
      weaponvelocity     = 500,
      damage = {
        chicken            = 0.0010000000474975,
        default            = 150,
        experimental_land  = 300,
        experimental_ships = 300,
        tinychicken        = 0.0010000000474975,
      },
    },
  },
  weapons = {
    [1]  = {
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[NOTVTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  weapon = {
    areaOfEffect       = 32,
    avoidFeature       = false,
    avoidFriendly      = false,
    craterareaofeffect = 0,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:NONE]],
    impulseBoost       = 2.2000000476837,
    impulseFactor      = 1,
    interceptedByShieldType = 0,
    name               = [[Claws]],
    noSelfDamage       = false,
    range              = 115,
    reloadtime         = 0.5,
    size               = 0,
    soundhitwet        = [[splshbig]],
    soundhitwetvolume  = 0.60000002384186,
    soundStart         = [[smallchickenattack]],
    targetBorder       = 1,
    tolerance          = 5000,
    turret             = false,
    waterWeapon        = false,
    weaponTimer        = 0.10000000149012,
    weaponType         = [[Cannon]],
    weaponVelocity     = 500,
    damage = {
      chicken            = 0.0010000000474975,
      default            = 150,
      experimental_land  = 300,
      experimental_ships = 300,
      tinychicken        = 0.0010000000474975,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    damage             = 3126.5068359375,
    description        = [[Chicken Wreckage]],
    metal              = 112.5,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
