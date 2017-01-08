-- UNITDEF -- CHICKENS1 --
--------------------------------------------------------------------------------

local unitName = "chickens1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.66,
	bmcode = [[1]],
	brakeRate = 0.4,
	buildCostEnergy = 174,
	buildCostMetal = 174,
	builder = false,
	buildTime = 1740,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[ALL MOBILE NOTDEFENSE NOTSUB NOTSUBNOTSHIP NOTVTOL WEAPON]],
	collisionVolumeOffsets = [[0 -3 0]],
	collisionVolumeScales = [[21 30 46]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Spike Spitter]],
	explodeAs = [[BUG_DEATH]],
	floater = false,
	footprintX = 3,
	footprintZ = 3,
	iconType = [[chickens]],
	idleAutoHeal = 20,
	idleTime = 300,
	leaveTracks = true,
	maneuverleashlength = [[750]],
	mass = 300,
	maxDamage = 675,
	maxSlope = 18,
	maxVelocity = 2.4,
	maxWaterDepth = 15,
	movementClass = [[AKBOT2]],
	name = [[Spiker]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickens.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[BUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 370,
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
	turnRate = 768,
	unitname = [[chickens1]],
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
			def = [[WATERWEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 160,
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			def = [[WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
			onlyTargetCategory = [[NOTVTOL]],
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
		reloadtime = 9,
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
		explosionGenerator = [[custom:dirt]],
		impulseBoost = 0,
		impulseFactor = 0.4,
		interceptedByShieldType = 0,
		model = [[spike.s3o]],
		name = [[Spike]],
		noSelfDamage = true,
		range = 350,
		reloadtime = 2.2,
		startVelocity = 300,
		subMissile = 1,
		targetMoveError = 0.5,
		turret = true,
		waterWeapon = false,
		weaponAcceleration = 70,
		weaponTimer = 1,
		weaponType = [[Cannon]],
		weaponVelocity = 325,
		damage = {
			bombers = 600,
			default = 466,
			experimental_land = 932,
			experimental_ships = 932,
			fighters = 600,
			flak_resistant = 200,
			unclassed_air = 600,
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
