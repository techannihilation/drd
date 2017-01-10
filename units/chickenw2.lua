-- UNITDEF -- CHICKENW2 --
--------------------------------------------------------------------------------

local unitName = "chickenw2"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.66000002622604,
  airSightDistance   = 1500,
  amphibious         = [[true]],
  autoHeal           = 10,
  bankscale          = 1,
  bmcode             = 1,
  brakeRate          = 0.0060000000521541,
  buildCostEnergy    = 2200,
  buildCostMetal     = 72,
  builder            = false,
  buildPic           = [[chicken_pidgeon.png]],
  buildTime          = 1300,
  cancrash           = [[false]],
  canFly             = false,
  canGuard           = false,
  canland            = [[true]],
  canMove            = false,
  canPatrol          = false,
  canstop            = [[true]],
  canSubmerge        = false,
  category           = [[VTOL MOBILE WEAPON NOTSUB NOTSHIP NOTHOVER ALL]],
  collide            = false,
  collisionvolumeoffsets = [[0 7 -6]],
  collisionvolumescales = [[48 12 22]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  cruiseAlt          = 150,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Fighter]],
  explodeAs          = [[TALON_DEATH]],
  floater            = false,
  footprintX         = 1,
  footprintZ         = 1,
  hideDamage         = false,
  iconType           = [[chickenf]],
  maneuverleashlength = 1280,
  mass               = 183.33332824707,
  maxDamage          = 1100,
  maxVelocity        = 11,
  moverate1          = 32,
  name               = [[Crow]],
  noAutoFire         = false,
  noChaseCategory    = [[NOTVTOL]],
  objectName         = [[chicken_crow.s3o]],
  seismicSignature   = 0,
  selfDestructAs     = [[TALON_DEATH]],
  separation         = 0.20000000298023,
  side               = [[THUNDERBIRDS]],
  sightDistance      = 0,
  smoothAnim         = false,
  steeringmode       = 1,
  turninplace        = 0,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 7.2600002288818,
  turnRate           = 7000,
  unitname           = [[chickenw2]],
  workerTime         = 0,
  customparams = {
    buildPic           = [[chicken_pidgeon.png]],
  },
  featuredefs = {
    dead = {
      filename           = [[units/chickenw2.lua]],
    },
    heap = {
      filename           = [[units/chickenw2.lua]],
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
      badTargetCategory  = [[NOTVTOL]],
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 90,
      onlyTargetCategory = [[VTOL]],
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
   weapon = {
      areaofeffect       = 32,
      avoidfriendly      = [[false]],
      burnblow           = [[false]],
      collidefriendly    = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      edgeeffectiveness  = 0,
      explosiongenerator = [[custom:dirt]],
      impulseboost       = 1,
      impulsefactor      = 1,
      interceptedbyshieldtype = 0,
      model              = [[spike.s3o]],
      name               = [[Spike]],
      noselfdamage       = [[false]],
      predictboost       = 1,
      range              = 600,
      reloadtime         = 1.6000000238419,
      smoketrail         = [[false]],
      soundhitwet        = [[sizzle]],
      soundhitwetvolume  = 0.5,
      soundstart         = [[talonattack]],
      startvelocity      = 600,
      texture1           = [[]],
      texture2           = [[sporetrail]],
      turret             = [[false]],
      weaponacceleration = 250,
      weapontimer        = 1,
      weaponvelocity     = 1000,
      damage = {
        bombers            = 450,
        default            = 200,
        fighters           = 700,
        vtol               = 600,
      },
    },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
