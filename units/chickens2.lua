-- UNITDEF -- CHICKENS2 --
--------------------------------------------------------------------------------

local unitName = "chickens2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 3,
	bmcode = [[1]],
	brakeRate = 3,
	buildCostEnergy = 174,
	buildCostMetal = 174,
	builder = false,
	buildTime = 1740,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTHOVERNOTVTOL NOTVTOL NOTSUB NOTSHIP ALL]],
	cloakable = 1,
	cloakCost = 0,
	cloakCostMoving = 0,
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[24 34 53]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Advanced Spike Spitter]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[chickens]],
	idleAutoHeal = 20,
	idleTime = 300,
	initcloaked = 1,
	leaveTracks = true,
	maneuverleashlength = [[750]],
	mass = 300,
	maxDamage = 5000,
	maxSlope = 18,
	maxVelocity = 9,
	maxWaterDepth = 15,
	minCloakDistance = 200,
	movementClass = [[AKBOT2]],
	name = [[Spiker]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickens2.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 720,
	smoothAnim = true,
	sonardistance = 720,
	steeringmode = [[2]],
	TEDClass = [[AKBOT2]],
	trackOffset = 6,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 30,
	turninplace = 0,
	turnRate = 1900,
	unitname = [[chickens2]],
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
		[2] = {
			badTargetCategory = [[VTOL]],
			def = [[WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
		},
		[1] = {
			def = [[WATERWEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 160,
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WATERWEAPON = {
		areaofeffect = 16,
		avoidfriendly = 0,
		burnblow = 1,
		collidefriendly = 0,
		craterboost = 0,
		cratermult = 0,
		explosiongenerator = [[custom:dirt]],
		impulseboost = 0.123,
		impulsefactor = 0.123,
		model = [[spike.s3o]],
		name = [[Sea Spike]],
		noselfdamage = 1,
		range = 690,
		reloadtime = 5,
		startvelocity = 150,
		tolerance = 32767,
		tracks = 1,
		turnrate = 1500,
		turret = 1,
		waterweapon = 1,
		weaponacceleration = 25,
		weapontimer = 4,
		weaponvelocity = 220,
		damage = {
			default = 775,
			experimental_land = 1550,
			experimental_ships = 1550,
		},
	},
	WEAPON = {
		areaOfEffect = 16,
		avoidFeature = 0,
		avoidFriendly = false,
		avoidfriendly = 0,
		burnblow = true,
		collideFeature = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeeffectiveness = 0,
		explosionGenerator = [[custom:ASPIKER]],
		impulseBoost = 0,
		impulseFactor = 0.4,
		interceptedByShieldType = 0,
		model = [[spike.s3o]],
		name = [[Spike]],
		noSelfDamage = true,
		range = 470,
		reloadtime = 2.2,
		smokeTrail = true,
		startVelocity = 600,
		texture1 = [[]],
		texture2 = [[sporetrail]],
		turret = true,
		waterWeapon = false,
		weaponTimer = 1,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 600,
		damage = {
			default = 1130,
			experimental_land = 2260,
			experimental_ships = 2260,
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
