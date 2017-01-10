-- UNITDEF -- RROOST --
--------------------------------------------------------------------------------

local unitName = "rroost"

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
	category = [[NOTVTOL NOTSUB NOTSHIP ALL]],
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
	name = [[Robot Teleport Station]],
	noAutoFire = false,
	objectName = [[rroost.3do]],
	radardistance = 100000,
	radarEmitHeight = 300,
	reclaimable = false,
	script = [[rroost.lua]],
	seismicSignature = 4,
	selfDestructAs = [[ROOST_DEATH]],
	selfDestructCountdown = 7200,
	side = [[ARM]],
	sightDistance = 100000,
	smoothAnim = true,
	turnRate = 0,
	unitname = [[rroost]],
	upright = false,
	waterline = 0,
	workerTime = 0,
	yardMap = [[ooooooooo]],
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:teleport_beam]],
			[2] = [[custom:sky_enterance]],
			[3] = [[custom:teleport_device]],


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
		avoidFriendly = false,
		accuracy = 1,
		areaOfEffect = 100,
		craterBoost = 0,
		craterMult = 0,
		duration = 10.6,
		explosionGenerator = [[custom:none]],
		impulseBoost = 0.123,
		impulseFactor = 0.123,
		intensity = 25,
		name = [[Lightning Transport Beam]],
		noSelfDamage = true,
		range = 3000,
		reloadtime = 0.001,
		rgbColor = [[0.6 0.6 0.9]],
		soundHitDry = [[maghit]],
		soundStart = [[krypto]],
		texture1 = [[strike]],
		thickness = 40,
		tolerance = 6,
		turret = true,
		weaponType = [[LightningCannon]],
		weaponVelocity = 560,
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
