-- UNITDEF -- CHICKENH3 --
--------------------------------------------------------------------------------

local unitName = "chickenh3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.36,
	bmcode = [[1]],
	brakeRate = 0.2,
	buildCostEnergy = 2325.8,
	buildCostMetal = 122.8,
	builder = false,
	buildTime = 3328,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 2 0]],
	collisionVolumeScales = [[30 38 60]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Progenitor Hatchling]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 2,
	footprintZ = 2,
	hidedamage = 1,
	iconType = [[chicken]],
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 700,
	maxDamage = 1200,
	maxSlope = 18,
	maxVelocity = 4.5,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Chicken]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[s_chickenboss2_white.s3o]],
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 500,
	smoothAnim = true,
	steeringmode = [[2]],
	trackOffset = 0,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 18,
	turninplace = 0,
	turnRate = 768,
	unitname = [[chickenh3]],
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
		range = 130,
		reloadtime = 0.75,
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
			default = 200,
			experimental_land = 400,
			experimental_ships = 400,
			tinychicken = 0,
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
