-- UNITDEF -- CHICKEN1X --
--------------------------------------------------------------------------------

local unitName = "chicken1x"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.30000001192093,
  autoHeal           = 3,
  bmcode             = 1,
  brakeRate          = 2.7000000476837,
  buildCostEnergy    = 78.800003051758,
  buildCostMetal     = 78.800003051758,
  builder            = false,
  buildTime          = 1000,
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
  mass               = 166.66667175293,
  maxDamage          = 1000,
  maxSlope           = 18,
  maxVelocity        = 4.5,
  maxWaterDepth      = 15,
  movementClass      = [[KBOT2]],
  name               = [[Chicken]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chicken1x.s3o]],
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
  turninplacespeedlimit = 2.9700000286102,
  turnRate           = 700,
  unitname           = [[chicken1x]],
  upright            = false,
  waterline          = 8,
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 1196.2790527344,
      description        = [[Chicken Wreckage]],
      filename           = [[units/chicken1x.lua]],
      metal              = 59.100002288818,
    },
    heap = {
      filename           = [[units/chicken1x.lua]],
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
      reloadtime         = 0.89999997615814,
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
  chicken1x_chicken1x_weapon = {
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
    reloadtime         = 0.89999997615814,
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
    damage             = 1196.2790527344,
    description        = [[Chicken Wreckage]],
    metal              = 59.100002288818,
  },
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
