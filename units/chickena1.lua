-- UNITDEF -- CHICKENA1 --
--------------------------------------------------------------------------------

local unitName = "chickena1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.36,
	airSightDistance = 650,
	bmcode = [[1]],
	brakeRate = 0.4,
	buildCostEnergy = 3520,
	buildCostMetal = 152,
	builder = false,
	buildTime = 3820,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE NOTDEFENSE NOTHOVERNOTVTOL NOTSUB NOTSUBNOTSHIP NOTVTOL ALL]],
	collisionVolumeOffsets = [[0 2 0]],
	collisionVolumeScales = [[27 38 60]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Assault]],
	explodeAs = [[BIGBUG_DEATH]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[chickena]],
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 1500,
	maxDamage = 4250,
	maxSlope = 18,
	maxVelocity = 1.1,
	maxWaterDepth = 15,
	movementClass = [[CHICKENHKBOT4]],
	name = [[Cockatrice]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickena.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[BIGBUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 430,
	smoothAnim = true,
	steeringmode = [[2]],
	TEDClass = [[KBOT]],
	trackOffset = 7,
	trackStrength = 9,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 34,
	turninplace = 0,
	turnRate = 568,
	unitname = [[chickena1]],
	upright = false,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:blood_spray]],
			[2] = [[custom:blood_explode]],
			[3] = [[custom:dirt]],
			[4] = [[custom:blob_fire]],
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = [[VTOL]],
			def = [[WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 125,
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			badTargetCategory = [[NOTVTOL]],
			def = [[AAWEAPON]],
			onlyTargetCategory = [[VTOL]],
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	AAWEAPON = {
		areaOfEffect = 124,
		avoidFriendly = false,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		dance = 20,
		edgeeffectiveness = 0.33,
		explosionGenerator = [[custom:blood_explode_blue]],
		fireStarter = 0,
		flightTime = 5,
		heightmod = 0.5,
		impulseBoost = 0,
		impulseFactor = 0.4,
		model = [[AgamAutoBurst]],
		name = [[BlobMissile]],
		noSelfDamage = true,
		range = 550,
		reloadtime = 7,
		smokeTrail = true,
		soundhit = [[junohit2edit]],
		startVelocity = 200,
		texture1 = [[]],
		texture2 = [[sporetrail]],
		tolerance = 10000,
		tracks = true,
		trajectoryHeight = 2,
		turnRate = 24000,
		turret = true,
		weaponAcceleration = 75,
		weaponType = [[MissileLauncher]],
		weaponVelocity = 800,
		wobble = 32000,
		damage = {
			bombers = 525,
			default = 5,
			fighters = 525,
			flak_resistant = 525,
			unclassed_air = 525,
		},
	},
	WEAPON = {
		areaOfEffect = 42,
		avoidFeature = 0,
		avoidFriendly = 0,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:NONE]],
		impulseBoost = 1,
		impulseFactor = 2.2,
		interceptedByShieldType = 0,
		name = [[Claws]],
		noSelfDamage = true,
		range = 130,
		reloadtime = 0.66,
		size = 0,
		soundStart = [[smallchickenattack]],
		targetborder = 1,
		tolerance = 5000,
		turret = true,
		waterWeapon = true,
		weaponType = [[Cannon]],
		weaponVelocity = 700,
		damage = {
			chicken = 0.001,
			default = 120,
			experimental_land = 240,
			experimental_ships = 240,
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
