-- UNITDEF -- CHICKENH4 --
--------------------------------------------------------------------------------

local unitName = "chickenh4"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.56,
	bmcode = [[1]],
	brakeRate = 0.2,
	buildCostEnergy = 250,
	buildCostMetal = 20,
	builder = false,
	buildTime = 528,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL SURFACE]],
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[10 14 22]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Hatchling Swarmer]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 2,
	footprintZ = 2,
	iconType = [[chicken]],
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 100,
	maxDamage = 320,
	maxSlope = 18,
	maxVelocity = 9,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Chicken]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[s_chicken_white.s3o]],
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 300,
	smoothAnim = true,
	steeringmode = [[2]],
	trackOffset = 0,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 18,
	turninplace = 0,
	turnRate = 768,
	unitname = [[chickenh4]],
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
		range = 90,
		reloadtime = 0.5,
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
			default = 100,
			experimental_land = 200,
			experimental_ships = 200,
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
