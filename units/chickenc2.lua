-- UNITDEF -- CHICKENC2 --
--------------------------------------------------------------------------------

local unitName = "chickenc2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1.25,
	bmcode = [[1]],
	brakeRate = 2,
	buildCostEnergy = 5280,
	buildCostMetal = 170,
	builder = false,
	buildTime = 6280,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 11 3]],
	collisionVolumeScales = [[25 38 64]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[All-Terrain Assault]],
	explodeAs = [[BIGBUG_DEATH]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[chickenr]],
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 900,
	maxDamage = 9000,
	maxreversevelocity = 2.5,
	maxSlope = 18,
	maxVelocity = 3.5,
	maxWaterDepth = 15,
	movementClass = [[TKBOT3]],
	name = [[Manticore]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickenc2.s3o]],
	seismicSignature = 3,
	selfDestructAs = [[BIGBUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 512,
	smoothAnim = true,
	sonarDistance = 450,
	steeringmode = [[2]],
	trackOffset = 0.5,
	trackStrength = 9,
	trackStretch = 1,
	trackType = [[ChickenTrackPointy]],
	trackWidth = 70,
	turninplace = 0,
	turnRate = 1200,
	unitname = [[chickenc2]],
	upright = false,
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
			maxAngleDif = 110,
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WEAPON = {
		accuracy = 128,
		areaOfEffect = 120,
		avoidFeature = 0,
		camerashake = 0,
		cegTag = [[ROCKTRAILsm]],
		craterBoost = 0,
		craterMult = 0,
		edgeeffectiveness = 0.25,
		explosionGenerator = [[custom:gundam_MISSILE_EXPLOSION]],
		impulseBoost = 0.22,
		impulseFactor = 0.22,
		intensity = 0.7,
		interceptedByShieldType = 1,
		model = [[SGreyRock1.S3O]],
		name = [[Blob]],
		noSelfDamage = true,
		range = 350,
		reloadtime = 1.8,
		rgbColor = [[0.0 0.6 0.6]],
		size = 8,
		sizeDecay = -0.3,
		soundhit = [[xplomed2]],
		sprayAngle = 256,
		targetmoveerror = 0.2,
		tolerance = 5000,
		turret = true,
		weaponTimer = 0.2,
		weaponVelocity = 500,
		damage = {
			default = 1100,
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
