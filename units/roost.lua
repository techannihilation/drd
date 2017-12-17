-- UNITDEF -- ROOST --
--------------------------------------------------------------------------------

local unitName = "roost"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0,
	activateWhenBuilt = true,
	bmcode = [[0]],
	brakeRate = 0,
	buildCostEnergy = 25000,
	buildCostMetal = 400,
	builder = false,
	buildTime = 12500,
	capturable = false,
	category = [[NOTVTOL NOTSUB NOTSHIP ALL SURFACE]],
	collisionVolumeOffsets = [[0 0 0]],
	collisionVolumeScales = [[56 11 56]],
	collisionVolumeType = [[box]],
	description = [[Spawns Chicken]],
	energyMake = 35000,
	energystorage = 200000,
	explodeAs = [[ROOST_DEATH]],
	footprintX = 3,
	footprintZ = 3,
	iconType = [[special]],
	idleAutoHeal = 0,
	idleTime = 1800,
	levelGround = false,
	losEmitHeight = 600,
	mass = 165.75,
	maxDamage = 6800,
	maxVelocity = 0,
	metalMake = 20,
	name = [[Roost]],
	noAutoFire = false,
	objectName = [[roost.3do]],
	radardistance = 100000,
	radarEmitHeight = 300,
	reclaimable = false,
	seismicSignature = 4,
	selfDestructAs = [[ROOST_DEATH]],
	selfDestructCountdown = 7200,
	side = [[ARM]],
	sightDistance = 100000,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[roost]],
	upright = false,
	waterline = 0,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:dirt2]],
			[2] = [[custom:dirt3]],
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
		areaofeffect = 450,
		AvoidFriendly = 0,
		cegTag = [[ASTEROIDTRAIL_Expl]],
		CollideFriendly = 0,
		craterBoost = 0,
		craterMult = 0,
		edgeeffectiveness = 0,
		explosionGenerator = [[custom:COMM_EXPLOSION]],
		firestarter = 70,
		metalpershot = 0,
		model = [[greyrock2.s3o]],
		name = [[Asteroid]],
		range = 29999,
		reloadtime = 5,
		smoketrail = 1,
		soundhit = [[xplonuk4]],
		startvelocity = 2000,
		turret = 1,
		weaponacceleration = 120,
		weapontimer = 10,
		weaponvelocity = 2000,
		wobble = 0,
		damage = {
			chicken = 10,
			default = 6000,
			tinychicken = 10,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
