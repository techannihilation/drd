-- UNITDEF -- CHICKEN1Y --
--------------------------------------------------------------------------------

local unitName = "chicken1y"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.30000001192093,
  autoHeal           = 3,
  bmcode             = 1,
  brakeRate          = 2.7000000476837,
  buildCostEnergy    = 78.800003051758,
  buildCostMetal     = 78.800003051758,
  builder            = false,
  buildTime          = 1100,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 1,
  category           = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
  collisionvolumeoffsets = [[0 -3 -3]],
  collisionvolumescales = [[18 26 40]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Swarmer Assault]],
  explodeAs          = [[BUG_DEATH]],
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  iconType           = [[chicken]],
  leaveTracks        = false,
  maneuverleashlength = 640,
  mass               = 162.5,
  maxDamage          = 975,
  maxSlope           = 18,
  maxVelocity        = 4.75,
  maxWaterDepth      = 15,
  movementClass      = [[KBOT2]],
  name               = [[Chicken]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chicken1y.s3o]],
  seismicSignature   = 0,
  selfDestructAs     = [[BUG_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 256,
  smoothAnim         = false,
  steeringmode       = 2,
  trackOffset        = 0,
  trackStrength      = 8,
  trackStretch       = 1,
  trackType          = [[ChickenTrack]],
  trackWidth         = 18,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 3.1350002288818,
  turnRate           = 800,
  unitname           = [[chicken1y]],
  upright            = false,
  waterline          = 8,
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 1173.7779541016,
      description        = [[Chicken Wreckage]],
      filename           = [[units/chicken1y.lua]],
      metal              = 59.100002288818,
    },
    heap = {
      filename           = [[units/chicken1y.lua]],
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
      areaofeffect       = 24,
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
      range              = 100,
      reloadtime         = 0.87000000476837,
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
        default            = 54,
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
  chicken1y_chicken1y_weapon = {
    areaOfEffect       = 24,
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
    range              = 100,
    reloadtime         = 0.87000000476837,
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
      default            = 54,
      tinychicken        = 0.0010000000474975,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
  dead = {
    damage             = 1173.7779541016,
    description        = [[Chicken Wreckage]],
    metal              = 59.100002288818,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
