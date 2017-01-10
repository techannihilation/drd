-- UNITDEF -- CHICKENS3 --
--------------------------------------------------------------------------------

local unitName = "chickens3"

--------------------------------------------------------------------------------

local unitDef = {
  acceleration       = 0.5,
  airStrafe          = false,
  autoHeal           = 7,
  brakeRate          = 1.0499999523163,
  buildCostEnergy    = 2200,
  buildCostMetal     = 72,
  builder            = false,
  buildPic           = [[chicken_pidgeon.png]],
  buildTime          = 1700,
  canFly             = false,
  canGuard           = false,
  canland            = [[true]],
  canMove            = false,
  canPatrol          = false,
  canstop            = [[true]],
  category           = [[VTOL MOBILE WEAPON NOTSUB NOTSHIP NOTHOVER ALL]],
  collide            = false,
  collisionvolumeoffsets = [[0 7 -6]],
  collisionvolumescales = [[48 12 22]],
  collisionvolumetest = 1,
  collisionvolumetype = [[box]],
  cruiseAlt          = 150,
  defaultmissiontype = [[VTOL_standby]],
  description        = [[Spiker Air Assault]],
  explodeAs          = [[TALON_DEATH]],
  floater            = false,
  footprintX         = 1,
  footprintZ         = 1,
  hideDamage         = false,
  hoverAttack        = false,
  iconType           = [[chickenf]],
  idleAutoHeal       = 2,
  idleTime           = 0,
  mass               = 316.66665649414,
  maxDamage          = 1900,
  maxVelocity        = 7,
  name               = [[Fang]],
  noChaseCategory    = [[VTOL]],
  objectName         = [[spiker_gunship.s3o]],
  seismicSignature   = 0,
  selfDestructAs     = [[TALON_DEATH]],
  side               = [[THUNDERBIRDS]],
  sightDistance      = 550,
  smoothAnim         = false,
  steeringmode       = 1,
  turninplaceanglelimit = 140,
  turninplacespeedlimit = 4.6200003623962,
  turnRate           = 900,
  unitname           = [[chickens3]],
  customparams = {
    buildPic           = [[chicken_pidgeon.png]],
  },
  featuredefs = {
    dead = {
      filename           = [[units/chickens3.lua]],
    },
    heap = {
      filename           = [[units/chickens3.lua]],
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
      accuracy           = 1100,
      areaofeffect       = 24,
      avoidfriendly      = [[false]],
      burnblow           = [[false]],
      collidefriendly    = [[false]],
      craterareaofeffect = 0,
      craterboost        = 0,
      cratermult         = 0,
      explosiongenerator = [[custom:dirt]],
      impulseboost       = 0,
      impulsefactor      = 0.40000000596046,
      interceptedbyshieldtype = 0,
      model              = [[spike.s3o]],
      name               = [[Spike]],
      noselfdamage       = [[false]],
      range              = 350,
      reloadtime         = 1.9500000476837,
      soundhitwet        = [[sizzle]],
      soundhitwetvolume  = 0.5,
      soundstart         = [[talonattack]],
      startvelocity      = 200,
      submissile         = [[true]],
      turret             = [[false]],
      weaponacceleration = 100,
      weapontimer        = 1,
      weaponvelocity     = 350,
      damage = {
        default            = 200,
      },
    },
  },
  weapons = {
    [1]  = {
      badTargetCategory  = [[WEAPON]],
      def                = [[weapon]],
      mainDir            = [[0 0 1]],
      maxAngleDif        = 120,
    },
  },
}


--------------------------------------------------------------------------------

local weaponDefs = {
  chickens3_chickens3_weapon = {
    accuracy           = 1100,
    areaOfEffect       = 24,
    avoidFriendly      = false,
    burnblow           = false,
    collideFriendly    = false,
    craterareaofeffect = 0,
    craterBoost        = 0,
    craterMult         = 0,
    explosionGenerator = [[custom:dirt]],
    impulseBoost       = 0,
    impulseFactor      = 0.40000000596046,
    interceptedByShieldType = 0,
    model              = [[spike.s3o]],
    name               = [[Spike]],
    noSelfDamage       = false,
    range              = 350,
    reloadtime         = 1.9500000476837,
    soundhitwet        = [[sizzle]],
    soundhitwetvolume  = 0.5,
    soundStart         = [[talonattack]],
    startVelocity      = 200,
    submissile         = false,
    turret             = false,
    weaponAcceleration = 100,
    weaponTimer        = 1,
    weaponVelocity     = 350,
    damage = {
      default            = 200,
    },
  },
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

return lowerkeys({ [unitName] = unitDef })

--------------------------------------------------------------------------------
