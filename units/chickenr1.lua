-- UNITDEF -- CHICKENR1 --
--------------------------------------------------------------------------------

local unitName = "chickenr1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.1,
	bmcode = [[1]],
	brakeRate = 0.36,
	buildCostEnergy = 12320,
	buildCostMetal = 396,
	builder = false,
	buildTime = 12320,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 1 0]],
	collisionVolumeScales = [[25 34 44]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Artillery]],
	explodeAs = [[LOBBER_MORPH]],
	footprintX = 3,
	footprintZ = 3,
	hidedamage = 1,
	highTrajectory = 1,
	iconType = [[chickenr]],
	idleAutoHeal = 20,
	idleTime = 300,
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 4000,
	maxDamage = 2500,
	maxSlope = 18,
	maxVelocity = 1.4,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Lobber]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickenr.s3o]],
	seismicSignature = 4,
	selfDestructAs = [[LOBBER_MORPH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 1250,
	smoothAnim = true,
	steeringmode = [[2]],
	trackOffset = 6,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 30,
	turninplace = 0,
	turnRate = 360,
	unitname = [[chickenr1]],
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
			badTargetCategory = [[MOBILE]],
			def = [[GOOLAUNCHER]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	GOOLAUNCHER = {
		accuracy = 512,
		areaOfEffect = 128,
		avoidFeature = 0,
		avoidFriendly = 0,
		burst = 3,
		burstrate = 0.8,
		cegTag = [[blob_trail]],
		collideFriendly = 0,
		craterBoost = 0,
		craterMult = 0,
		edgeeffectiveness = 0.33,
		explosionGenerator = [[custom:ELECTRIC_EXPLOSION]],
		impulseBoost = 0,
		impulseFactor = 0.4,
		intensity = 0.7,
		interceptedByShieldType = 1,
		name = [[GOOLAUNCHER]],
		noSelfDamage = true,
		proximityPriority = -4,
		range = 1250,
		reloadtime = 36,
		rgbColor = [[0.2 0.5 0.9]],
		size = 9,
		sizeDecay = 0,
		soundhit = [[junohit2edit]],
		sprayAngle = 512,
		tolerance = 5000,
		turret = true,
		weaponTimer = 0.2,
		weaponVelocity = 600,
		damage = {
			commanders = 300,
			default = 600,
			experimental_land = 1200,
			experimental_ships = 1200,
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
