-- UNITDEF -- CHICKEN1B --
--------------------------------------------------------------------------------

local unitName = "chicken1b"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.15,
	bmcode = [[1]],
	brakeRate = 0.3,
	buildCostEnergy = 52.8,
	buildCostMetal = 52.8,
	builder = false,
	buildTime = 528,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 -3 -3]],
	collisionVolumeScales = [[18 26 40]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Swarmer]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[chicken]],
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 30,
	maxDamage = 445,
	maxSlope = 18,
	maxVelocity = 3.2,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Chicken]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chicken1b.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 256,
	smoothAnim = true,
	steeringmode = [[2]],
	TEDClass = [[KBOT]],
	trackOffset = 0,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 18,
	turninplace = 0,
	turnRate = 700,
	unitname = [[chicken1b]],
	upright = false,
	waterline = 8,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:blood_spray]],
			[2] = [[custom:blood_explode]],
			[3] = [[custom:dirt]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			def = [[WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WEAPON = {
		areaOfEffect = 24,
		avoidFeature = 0,
		avoidFriendly = 0,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:NONE]],
		impulseBoost = 2.2,
		impulseFactor = 1,
		interceptedByShieldType = 0,
		name = [[Claws]],
		noSelfDamage = true,
		range = 100,
		reloadtime = 1.2,
		size = 0,
		soundStart = [[smallchickenattack]],
		targetborder = 1,
		tolerance = 5000,
		turret = true,
		waterWeapon = true,
		weaponTimer = 0.1,
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			chicken = 0.001,
			default = 54,
			experimental_land = 108,
			experimental_ships = 108,
			tinychicken = 0.001,
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

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
