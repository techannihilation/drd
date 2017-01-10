-- UNITDEF -- CHICKENH5 --
--------------------------------------------------------------------------------

local unitName = "chickenh5"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.80000001192093,
  autoHeal           = 8,
  bmcode             = 1,
  brakeRate          = 7.2000002861023,
  buildCostEnergy    = 5200.7998046875,
  buildCostMetal     = 250.80000305176,
  buildDistance      = 425,
  builder            = false,
  buildTime          = 12000,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canReclaim         = false,
  canRestore         = false,
  canstop            = 1,
  category           = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL]],
  collisionvolumeoffsets = [[0 10 2]],
  collisionvolumescales = [[37 55 90]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Chicken Overseer]],
  explodeAs          = [[BIGBUG_DEATH]],
  floater            = false,
  footprintX         = 2,
  footprintZ         = 2,
  hideDamage         = false,
  iconType           = [[chicken]],
  leaveTracks        = false,
  maneuverleashlength = 640,
  mass               = 1333.3333740234,
  maxDamage          = 8000,
  maxSlope           = 18,
  maxVelocity        = 3.7000000476837,
  maxWaterDepth      = 15,
  movementClass      = [[AKBOT2]],
  name               = [[Patriarch]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[brain_bug.s3o]],
  repairSpeed        = 450,
  selfDestructAs     = [[BUG_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 760,
  smoothAnim         = false,
  steeringmode       = 2,
  trackOffset        = 0,
  trackStrength      = 8,
  trackStretch       = 1,
  trackType          = [[ChickenTrack]],
  trackWidth         = 18,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 2.4420001506805,
  turnRate           = 1300,
  unitname           = [[chickenh5]],
  upright            = false,
  waterline          = 8,
  workerTime         = 450,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 5690.4946289062,
      description        = [[Patriarch Wreckage]],
      filename           = [[units/chickenh5.lua]],
      metal              = 188.10000610352,
    },
    heap = {
      filename           = [[units/chickenh5.lua]],
    },
  },
  nanoColor = {
    [1]  = 0.5799999833107,
    [2]  = 0.5799999833107,
    [3]  = 0.5799999833107,
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:blood_spray]],
      [[custom:blood_explode]],
      [[custom:dirt]],
      [[custom:BRAIN_SPHERE_EMIT]],
    },
  },
  weapondefs = nil,
  weapons = {
    [1]  = {
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[NOTVTOL]],
    },
    [2]  = {
      def                = [[controlblob]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
      onlyTargetCategory = [[NOTVTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
   controlblob = {
      areaofeffect       = 80,
      avoidfeature       = [[false]],
      avoidfriendly      = [[false]],
      camerashake        = 0,
      cegtag             = [[blood_trail]],
      collidefriendly    = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      edgeeffectiveness  = 0.25,
      explosiongenerator = [[custom:control_explode]],
      impulseboost       = 0,
      impulsefactor      = 0,
      intensity          = 0.69999998807907,
      interceptedbyshieldtype = 0,
      name               = [[ControlBlob]],
      noselfdamage       = [[false]],
      predictboost       = 1,
      proximitypriority  = -2,
      range              = 590,
      reloadtime         = 9.5,
      rgbcolor           = [[0.7 0.15 0.15]],
      size               = 18,
      sizedecay          = -0.30000001192093,
      soundhit           = [[junohit2edit]],
      soundhitwet        = [[sizzle]],
      soundhitwetvolume  = 0.5,
      tolerance          = 5000,
      turret             = [[false]],
      weapontimer        = 3,
      weaponvelocity     = 420,
      damage = {
        chicken            = 10,
        default            = 225,
        tinychicken        = 10,
      },
    },
    weapon = {
      areaofeffect       = 72,
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
      range              = 165,
      reloadtime         = 4,
      size               = 0,
      soundhitwet        = [[splssml]],
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
        chicken            = 200,
        default            = 900,
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
