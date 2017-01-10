-- UNITDEF -- CHICKEN_DODO2 --
--------------------------------------------------------------------------------

local unitName = "chicken_dodo2"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 6,
	activateWhenBuilt = true,
	bmcode = [[1]],
	brakeRate = 0.2,
	buildCostEnergy = 9000,
	buildCostMetal = 350,
	builder = false,
	buildTime = 6000,
	canGuard = true,
	canHover = [[1]],
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MEDIUM MOBILE WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
	collide = 0,
	collisionVolumeOffsets = [[0 3 0]],
	collisionVolumeScales = [[18 28 41]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Chicken Bomb]],
	explodeAs = [[DODO_DEATH2]],
	floater = false,
	footprintX = 1,
	footprintZ = 1,
	hidedamage = 1,
	iconType = [[chicken]],
	idleAutoHeal = 55,
	idleTime = 0,
	kamikaze = true,
	kamikazeDistance = 72,
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 1000,
	maxDamage = 1300,
	maxSlope = 18,
	maxVelocity = 8,
	maxWaterDepth = 0,
	movementClass = [[HOVER3]],
	name = [[Alpha Dodo]],
	noAutoFire = false,
	noChaseCategory = [[VTOL SINK HOVER]],
	objectName = [[big_chicken_dodo.s3o]],
	seismicSignature = 4,
	selfDestructAs = [[DODO_DEATH2]],
	selfDestructCountdown = 0,
	side = [[THUNDERBIRDS]],
	sightDistance = 100,
	smoothAnim = true,
	stealth = 1,
	steeringmode = [[2]],
	trackOffset = 1,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 10,
	turninplace = 0,
	turnRate = 1000,
	unitname = [[chicken_dodo2]],
	upright = false,
	waterline = 1,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:DODOTRAIL]],
			[2] = [[custom:blood_explode]],
			[3] = [[custom:dirt]],
		},
	},
}

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
