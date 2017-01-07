-- UNITDEF -- CHICKENP1 --
--------------------------------------------------------------------------------

local unitName = "chickenp1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 1,
	activateWhenBuilt = true,
	bmcode = [[1]],
	brakeRate = 0.6,
	buildCostEnergy = 6000,
	buildCostMetal = 200,
	builder = false,
	buildPic = [[]],
	buildTime = 5280,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MOBILE WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
	collisionVolumeOffsets = [[0 2 0]],
	collisionVolumeScales = [[30 38 60]],
	collisionVolumeType = [[box]],
	defaultmissiontype = [[Standby]],
	description = [[Chicken Flamer]],
	explodeAs = [[FLAMEBUG_DEATH]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[chicken]],
	idleAutoHeal = 25,
	idleTime = 0,
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 800,
	maxDamage = 2400,
	maxVelocity = 2.9,
	movementClass = [[CHICKENHKBOT3]],
	name = [[Bombardier]],
	noAutoFire = false,
	noChaseCategory = [[VTOL]],
	objectName = [[chicken_listener.s3o]],
	seismicSignature = 0,
	selfDestructAs = [[FLAMEBUG_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 390,
	smoothAnim = true,
	steeringmode = [[2]],
	TEDClass = [[KBOT]],
	trackOffset = 0,
	trackStrength = 8,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 50,
	turninplace = 0,
	turnRate = 950,
	unitname = [[chickenp1]],
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
			def = [[CHASEWEAPON]],
			mainDir = [[0 0 1]],
			onlyTargetCategory = [[NOTVTOL]],
		},
		[2] = {
			badTargetCategory = [[VTOL]],
			def = [[FLAMER]],
			mainDir = [[0 0 1]],
			maxAngleDif = 120,
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	CHASEWEAPON = {
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = [[custom:NONE]],
		impulseBoost = 0,
		impulseFactor = 0,
		name = [[Claws]],
		noSelfDamage = true,
		proximityPriority = -4,
		range = 150,
		reloadtime = 30,
		size = 0.001,
		targetborder = 1,
		tolerance = 5000,
		turret = [[true]],
		weaponType = [[Cannon]],
		weaponVelocity = 500,
		damage = {
			default = 0.001,
			experimental_land = 0.002,
			experimental_ships = 0.002,
		},
	},
	FLAMER = {
		areaofeffect = 64,
		avoidFeature = 0,
		avoidFriendly = 0,
		burst = 12,
		burstrate = 0.01,
		craterboost = 0,
		cratermult = 0,
		firestarter = 100,
		flamegfxtime = 1.9,
		groundbounce = 1,
		impulseboost = 0,
		impulsefactor = 0,
		intensity = 0.9,
		name = [[FlameThrower]],
		noselfdamage = true,
		proximityPriority = 4,
		range = 410,
		reloadtime = 0.7,
		rgbcolor = [[1 0.95 0.9]],
		rgbcolor2 = [[0.9 0.85 0.8]],
		sizegrowth = 1.2,
		soundstart = [[Flamhvy1]],
		soundtrigger = 0,
		sprayangle = 9600,
		targetmoveerror = 0.001,
		tolerance = 2500,
		turret = [[true]],
		weapontimer = 1,
		weaponvelocity = 300,
		damage = {
			chicken = 4,
			commanders = 20,
			default = 25,
			experimental_land = 50,
			experimental_ships = 50,
			flamethrowers = 8,
			tinychicken = 2,
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
