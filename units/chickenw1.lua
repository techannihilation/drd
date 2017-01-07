-- UNITDEF -- CHICKENW1 --
--------------------------------------------------------------------------------

local unitName = "chickenw1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.8,
	airSightDistance = 600,
	amphibious = true,
	bankscale = [[1]],
	bmcode = [[1]],
	brakeRate = 0.4,
	buildCostEnergy = 2200,
	buildCostMetal = 72,
	builder = false,
	buildPic = [[chicken_pidgeon.png]],
	buildTime = 1300,
	canCrash = false,
	canFly = true,
	canGuard = true,
	canLand = true,
	canMove = true,
	canPatrol = true,
	canstop = true,
	canSubmerge = false,
	category = [[SMALLVTOL VTOL MOBILE WEAPON NOTSUB NOTSHIP ALL]],
	collide = false,
	collisionVolumeOffsets = [[0 7 -6]],
	collisionVolumeScales = [[48 12 22]],
	collisionVolumeType = [[box]],
	cruiseAlt = 155,
	defaultmissiontype = [[VTOL_standby]],
	description = [[Flying Spike Spitter]],
	explodeAs = [[TALON_DEATH]],
	floater = true,
	footprintX = 1,
	footprintZ = 1,
	hidedamage = 1,
	iconType = [[chickenf]],
	idleAutoHeal = 2,
	idleTime = 0,
	maneuverleashlength = [[1280]],
	mass = 90,
	maxDamage = 295,
	maxVelocity = 7.5,
	moverate1 = [[32]],
	name = [[Claw]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chicken_pidgeon.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[TALON_DEATH]],
	separation = [[0.2]],
	side = [[THUNDERBIRDS]],
	sightDistance = 360,
	smoothAnim = true,
	steeringmode = [[1]],
	TEDClass = [[VTOL]],
	turninplace = 0,
	turnRate = 3200,
	unitname = [[chickenw1]],
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
			badTargetCategory = [[WEAPON]],
			def = [[WEAPON]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WEAPON = {
		accuracy = 200,
		areaOfEffect = 32,
		avoidFriendly = false,
		burnblow = true,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:dirt]],
		impulseBoost = 0,
		impulseFactor = 0.4,
		interceptedByShieldType = 0,
		model = [[spike.s3o]],
		name = [[Spike]],
		noSelfDamage = true,
		range = 400,
		reloadtime = 2.2,
		soundStart = [[talonattack]],
		startVelocity = 200,
		subMissile = 1,
		turret = true,
		waterWeapon = true,
		weaponAcceleration = 100,
		weaponTimer = 1,
		weaponVelocity = 425,
		damage = {
			bombers = 300,
			default = 140,
			experimental_land = 280,
			experimental_ships = 280,
			fighters = 300,
			flak_resistant = 100,
			unclassed_air = 300,
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
