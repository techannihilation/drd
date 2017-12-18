-- UNITDEF -- CHICKENA2B --
--------------------------------------------------------------------------------

local unitName = "chickena2b"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.36000001430511,
  airSightDistance   = 1800,
  autoHeal           = 40,
  bmcode             = 1,
  brakeRate          = 3.6000001430511,
  buildCostEnergy    = 3520,
  buildCostMetal     = 302,
  builder            = false,
  buildTime          = 22500,
  canAttack          = false,
  canGuard           = false,
  canMove            = false,
  canPatrol          = false,
  canstop            = 1,
  category           = [[ALL LARGE MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL SURFACE]],
  collisionvolumeoffsets = [[0 10 2]],
  collisionvolumescales = [[37 55 90]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  corpse             = [[dead]],
  defaultmissiontype = [[Standby]],
  description        = [[Advanced Assault]],
  explodeAs          = [[BIGBUG_DEATH]],
  footprintX         = 4,
  footprintZ         = 4,
  iconType           = [[chickena]],
  leaveTracks        = false,
  maneuverleashlength = 640,
  mass               = 6500,
  maxDamage          = 39000,
  maxSlope           = 18,
  maxVelocity        = 0.92500001192093,
  maxWaterDepth      = 15,
  movementClass      = [[CHICKENHKBOT4]],
  name               = [[Alpha Cockatrice]],
  noAutoFire         = false,
  noChaseCategory    = [[VTOL]],
  objectName         = [[chickena2b.s3o]],
  onlytargetcategory2 = [[VTOL]],
  seismicSignature   = 0,
  selfDestructAs     = [[BIGBUG_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 600,
  smoothAnim         = false,
  steeringmode       = 2,
  trackOffset        = 7,
  trackStrength      = 9,
  trackStretch       = 1,
  trackType          = [[ChickenTrack]],
  trackWidth         = 38,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 0.61050003767014,
  turnRate           = 468,
  unitname           = [[chickena2b]],
  upright            = false,
  workerTime         = 0,
  customparams = {
  },
  featuredefs = {
    dead = {
      damage             = 18669.427734375,
      description        = [[Alpha Cockatrice Wreckage]],
      filename           = [[units/chickena2b.lua]],
      metal              = 226.5,
    },
    heap = {
      filename           = [[units/chickena2b.lua]],
    },
  },
  sfxtypes = {
    explosiongenerators = {
      [[custom:blood_spray]],
      [[custom:blood_explode]],
      [[custom:dirt]],
      [[custom:blob_fire]],
    },
  },
  weapondefs = nil,
  weapons = {
    [1]  = {
      badTargetCategory  = [[VTOL]],
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 125,
      onlyTargetCategory = [[NOTVTOL]],
    },
    [2]  = {
      badTargetCategory  = [[NOTVTOL]],
      def                = [[aaweapon]],
      onlyTargetCategory = [[VTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
    aaweapon = {
      areaofeffect       = 200,
      avoidfeature       = [[false]],
      avoidfriendly      = [[false]],
      collidefriendly    = [[false]],
      craterareaofeffect = 200,
      craterboost        = 0,
      cratermult         = 0,
      dance              = 20,
      edgeeffectiveness  = 0.050000000745058,
      explosiongenerator = [[custom:blood_explode_blue]],
      firestarter        = 0,
      flighttime         = 2.5,
      heightmod          = 0.5,
      impulseboost       = 0,
      impulsefactor      = 0.40000000596046,
      interceptedbyshieldtype = 2,
      metalpershot       = 0,
      model              = [[AgamAutoBurst.s3o]],
      name               = [[BlobMissile]],
      noselfdamage       = [[false]],
      proximitypriority  = -4,
      range              = 900,
      reloadtime         = 8,
      smoketrail         = [[false]],
      soundhit           = [[junohit2edit]],
      soundhitwet        = [[splslrg]],
      soundhitwetvolume  = 0.60000002384186,
      startvelocity      = 200,
      texture1           = [[]],
      texture2           = [[sporetrail]],
      tolerance          = 10000,
      tracks             = [[false]],
      trajectoryheight   = 2,
      turnRate           = 24000,
      turret             = [[false]],
      weaponacceleration = 75,
      weapontype         = [[MissileLauncher]],
      weaponvelocity     = 700,
      wobble             = 32000,
      damage = {
        bombers            = 1100,
        default            = 400,
        fighters           = 1500,
        vtol               = 1300,
      },
    },
    weapon = {
      areaofeffect       = 42,
      avoidfeature       = [[false]],
      avoidfriendly      = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      explosiongenerator = [[custom:NONE]],
      impulseboost       = 1,
      impulsefactor      = 2.2000000476837,
      interceptedbyshieldtype = 0,
      name               = [[Claws]],
      noselfdamage       = [[false]],
      range              = 165,
      reloadtime         = 0.80000001192093,
      size               = 0,
      soundhitwet        = [[splshbig]],
      soundhitwetvolume  = 0.60000002384186,
      soundstart         = [[smallchickenattack]],
      targetborder       = 1,
      tolerance          = 5000,
      turret             = [[false]],
      waterweapon        = [[false]],
      weapontype         = [[Cannon]],
      weaponvelocity     = 700,
      damage = {
        chicken            = 0.0010000000474975,
        default            = 300,
        tinychicken        = 0.0010000000474975,
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
