-- UNITDEF -- CHICKEN2 --
--------------------------------------------------------------------------------

local unitName = "chicken2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.35,
	bmcode = [[1]],
	brakeRate = 0.3,
	buildCostEnergy = 1000,
	buildCostMetal = 100,
	builder = false,
	buildTime = 4280,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[20 29 44]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Advanced Swarmer]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[chicken]],
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 100,
	maxDamage = 2400,
	maxSlope = 18,
	maxVelocity = 5.2,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Chicken]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chicken2.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 356,
	smoothAnim = true,
	steeringmode = [[2]],
	TEDClass = [[KBOT]],
	trackOffset = 0,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 18,
	turninplace = 0,
	turnRate = 800,
	unitname = [[chicken2]],
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
			default = 162,
			experimental_land = 324,
			experimental_ships = 324,
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
