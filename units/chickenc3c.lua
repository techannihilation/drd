-- UNITDEF -- CHICKENC3C --
--------------------------------------------------------------------------------

local unitName = "chickenc3c"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 1.25,
  bmcode             = 1,
  brakeRate          = 18,
  buildCostEnergy    = 5280,
  buildCostMetal     = 99,
  builder            = false,
  buildTime          = 1250,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 1,
  category           = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL SURFACE]],
  collisionvolumeoffsets = [[0 -3 -3]],
  collisionvolumescales = [[18 28 40]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[All-Terrain Swarmer]],
  explodeAs          = [[BUG_DEATH]],
  footprintX         = 3,
  footprintZ         = 3,
  iconType           = [[chickenr]],
  leaveTracks        = false,
  maneuverleashlength = 640,
  mass               = 153.33332824707,
  maxDamage          = 920,
  maxreversevelocity = 3,
  maxSlope           = 18,
  maxVelocity        = 3.2000000476837,
  maxWaterDepth      = 15,
  movementClass      = [[TKBOT3]],
  name               = [[Weevil]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chickenc3c.s3o]],
  seismicSignature   = 1,
  selfDestructAs     = [[BIGBUG_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 370,
  smoothAnim         = false,
  sonarDistance      = 450,
  steeringmode       = 2,
  trackOffset        = 0.5,
  trackStrength      = 9,
  trackStretch       = 1,
  trackType          = [[ChickenTrackPointy]],
  trackWidth         = 35,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 2.1120002269745,
  turnRate           = 900,
  unitname           = [[chickenc3c]],
  upright            = false,
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 1123.7595214844,
      description        = [[Weevil Wreckage]],
      filename           = [[units/chickenc3c.lua]],
      metal              = 74.25,
    },
    heap = {
      filename           = [[units/chickenc3c.lua]],
    },
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:blood_spray]],
      [[custom:blood_explode]],
      [[custom:dirt]],
    },
  },
  weapondefs = nil,
  weapons = {
    [1]  = {
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 110,
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
   weapon = {
      accuracy           = 512,
      areaofeffect       = 120,
      avoidfeature       = [[false]],
      camerashake        = 0,
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      edgeeffectiveness  = 0.25,
      explosiongenerator = [[custom:blood_explode_blue]],
      impulseboost       = 0.21999999880791,
      impulsefactor      = 0.21999999880791,
      intensity          = 0.69999998807907,
      interceptedbyshieldtype = 1,
      name               = [[Blob]],
      noselfdamage       = [[false]],
      range              = 245,
      reloadtime         = 3.5999999046326,
      rgbcolor           = [[0.3 0.5 0.6]],
      size               = 8,
      sizedecay          = -0.30000001192093,
      soundhit           = [[junohit2edit]],
      soundhitwet        = [[sizzle]],
      soundhitwetvolume  = 0.5,
      targetmoveerror    = 0.40000000596046,
      tolerance          = 5000,
      turret             = [[false]],
      weapontimer        = 0.5,
      weaponvelocity     = 200,
      damage = {
        chicken            = 10,
        default            = 300,
        tinychicken        = 10,
      },
    },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	DEAD = {
	},
	HEAP = {
	},
}
unitDef.featureDefs = featureDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
