-- UNITDEF -- CHICKENF2 --
--------------------------------------------------------------------------------

local unitName = "chickenf2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1,
	airHoverFactor = 0,
	attackrunlength = 32,
	bmcode = [[1]],
	brakeRate = 0.4,
	buildCostEnergy = 50,
	buildCostMetal = 50,
	builder = false,
	buildTime = 16250,
	canAttack = true,
	canFly = true,
	canGuard = true,
	canLand = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	canSubmerge = true,
	category = [[VTOL MOBILE WEAPON NOTSUB NOTSHIP ALL]],
	collide = false,
	collisionVolumeOffsets = [[0 8 -2]],
	collisionVolumeScales = [[70 14 48]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	cruiseAlt = 325,
	defaultmissiontype = [[Standby]],
	description = [[Flying Chicken Scout]],
	explodeAs = [[TALON_DEATH]],
	footprintX = 3,
	footprintZ = 3,
	hidedamage = 1,
	iconType = [[chickenf]],
	idleAutoHeal = 15,
	idleTime = 900,
	maneuverleashlength = [[20000]],
	mass = 227.5,
	maxDamage = 1800,
	maxVelocity = 4.6,
	moverate1 = [[32]],
	name = [[Buzzard]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chickenf1.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[TALON_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 1400,
	smoothAnim = true,
	steeringmode = [[2]],
	turninplace = 0,
	turnRate = 900,
	unitname = [[chickenf2]],
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
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	WEAPON = {
		accuracy = 400,
		areaOfEffect = 200,
		avoidFeature = false,
		avoidFriendly = false,
		burst = 1,
		burstrate = 1,
		collideFriendly = false,
		craterBoost = 0,
		craterMult = 0,
		edgeEffectiveness = 0,
		explosionGenerator = [[]],
		impulseBoost = 1,
		impulseFactor = 1,
		interceptedByShieldType = 0,
		model = [[chickeneggred.s3o]],
		mygravity = 0.5,
		name = [[GooBombs]],
		noSelfDamage = true,
		range = 800,
		reloadtime = 30,
		soundhit = [[junohit2edit]],
		sprayAngle = 400,
		weaponType = [[AircraftBomb]],
		damage = {
			chicken = 10,
			default = 250,
			tinychicken = 10,
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
