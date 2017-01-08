-- UNITDEF -- CHICKENF1B --
--------------------------------------------------------------------------------

local unitName = "chickenf1b"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.26400002837181,
  airHoverFactor     = 0,
  attackrunlength    = 32,
  bmcode             = 1,
  brakeRate          = 0.012000000104308,
  buildCostEnergy    = 4550,
  buildCostMetal     = 212,
  builder            = false,
  buildTime          = 6250,
  canAttack          = false,
  canFly             = false,
  canGuard           = false,
  canland            = [[true]],
  canMove            = false,
  canPatrol          = false,
  canstop            = 1,
  canSubmerge        = false,
  category           = [[VTOL MOBILE WEAPON NOTSUB NOTSHIP NOTHOVER ALL]],
  collide            = false,
  collisionvolumeoffsets = [[0 8 -2]],
  collisionvolumescales = [[70 14 48]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  cruiseAlt          = 270,
  defaultmissiontype = [[Standby]],
  description        = [[Flying Chicken Bomber]],
  explodeAs          = [[TALON_DEATH]],
  footprintX         = 3,
  footprintZ         = 3,
  hideDamage         = false,
  iconType           = [[chickenf]],
  idleAutoHeal       = 5,
  idleTime           = 0,
  maneuverleashlength = 20000,
  mass               = 266.66665649414,
  maxDamage          = 1600,
  maxVelocity        = 4.8000001907349,
  moverate1          = 32,
  name               = [[Talon]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chickenf1b.s3o]],
  seismicSignature   = 0,
  selfDestructAs     = [[TALON_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 1000,
  smoothAnim         = false,
  steeringmode       = 2,
  TEDClass           = [[VTOL]],
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 3.1680002212524,
  turnRate           = 1100,
  unitname           = [[chickenf1b]],
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 1701.8547363281,
      description        = [[Talon Wreckage]],
      filename           = [[units/chickenf1b.lua]],
      metal              = 159,
    },
    heap = {
      filename           = [[units/chickenf1b.lua]],
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
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
    weapon = {
      accuracy           = 1000,
      areaofeffect       = 150,
      avoidfeature       = [[false]],
      avoidfriendly      = [[false]],
      burst              = 11,
      burstrate          = 0.40999999642372,
      collidefriendly    = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      edgeeffectiveness  = 0.10000000149012,
      explosiongenerator = [[custom:gundam_MISSILE_EXPLOSION]],
      impulseboost       = 1,
      impulsefactor      = 1,
      interceptedbyshieldtype = 0,
      model              = [[chickeneggyellow.s3o]],
      name               = [[GooBombs]],
      noselfdamage       = [[false]],
      range              = 700,
      reloadtime         = 9,
      soundhit           = [[junohit2edit]],
      soundhitwet        = [[splslrg]],
      soundhitwetvolume  = 0.60000002384186,
      sprayangle         = 2000,
      weapontype         = [[AircraftBomb]],
      damage = {
        chicken            = 75,
        default            = 250,
        tinychicken        = 75,
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
