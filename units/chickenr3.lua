-- UNITDEF -- CHICKENR3 --
--------------------------------------------------------------------------------

local unitName = "chickenr3"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 8,
	bmcode = [[1]],
	brakeRate = 8,
	buildCostEnergy = 12320,
	buildCostMetal = 396,
	builder = false,
	buildTime = 180000,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL SURFACE]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Meteor Launcher]],
	explodeAs = [[LOBBER_MORPH]],
	footprintX = 4,
	footprintZ = 4,
	hidedamage = 1,
	highTrajectory = 1,
	iconType = [[chickenr]],
	idleAutoHeal = 20,
	idleTime = 300,
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 4000,
	maxDamage = 60000,
	maxSlope = 18,
	maxVelocity = 6,
	maxWaterDepth = 15,
	movementClass = [[CHICKQUEEN]],
	name = [[Chicken Colonizer]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chicken_colonizer.s3o]],
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
	trackWidth = 70,
	turninplace = 0,
	turnRate = 1500,
	unitname = [[chickenr3]],
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
			def = [[METEORLAUNCHER]],
			mainDir = [[0 0 1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	METEORLAUNCHER = {
		areaofeffect = 600,
		AvoidFriendly = 0,
		cegTag = [[ASTEROIDTRAIL_Expl]],
		CollideFriendly = 0,
		craterBoost = 0,
		craterMult = 0,
		edgeeffectiveness = 0,
		explosionGenerator = [[custom:COMM_EXPLOSION]],
		firestarter = 70,
		highTrajectory = 1,
		model = [[greyrock2.s3o]],
		name = [[METEORLAUNCHER]],
		ProximityPriority = -12,
		range = 29999,
		reloadtime = 15,
		soundhit = [[xplonuk4]],
		turret = 1,
		weaponvelocity = 3000,
		damage = {
			default = 3000,
			experimental_land = 6000,
			experimental_ships = 6000,
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
