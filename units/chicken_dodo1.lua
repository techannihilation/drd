-- UNITDEF -- CHICKEN_DODO1 --
--------------------------------------------------------------------------------

local unitName = "chicken_dodo1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 6,
	activateWhenBuilt = true,
	bmcode = [[1]],
	brakeRate = 0.2,
	buildCostEnergy = 3000,
	buildCostMetal = 128,
	builder = false,
	buildTime = 3080,
	canGuard = true,
	canHover = [[1]],
	canMove = true,
	canPatrol = true,
	canstop = [[1]],
	category = [[MEDIUM MOBILE WEAPON NOTVTOL NOTSUB NOTSHIP ALL SURFACE]],
	collide = 0,
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[10 14 22]],
	collisionVolumeType = [[box]],
	corpse = [[DEAD]],
	defaultmissiontype = [[Standby]],
	description = [[Chicken Bomb]],
	explodeAs = [[DODO_DEATH1]],
	floater = false,
	footprintX = 1,
	footprintZ = 1,
	hidedamage = 1,
	iconType = [[chicken]],
	kamikaze = true,
	kamikazeDistance = 36,
	leaveTracks = true,
	maneuverleashlength = [[640]],
	mass = 1000,
	maxDamage = 198,
	maxSlope = 18,
	maxVelocity = 7,
	maxWaterDepth = 0,
	movementClass = [[HOVER3]],
	name = [[Dodo]],
	noAutoFire = false,
	noChaseCategory = [[VTOL SINK HOVER]],
	objectName = [[chicken_dodo.s3o]],
	seismicSignature = 2,
	selfDestructAs = [[DODO_DEATH1]],
	selfDestructCountdown = 0,
	side = [[THUNDERBIRDS]],
	sightDistance = 36,
	smoothAnim = true,
	stealth = 1,
	steeringmode = [[2]],
	trackOffset = 1,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 10,
	turninplace = 0,
	turnRate = 2000,
	unitname = [[chicken_dodo1]],
	upright = false,
	waterline = 1,
	workerTime = 0,
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = [[custom:blood_spray]],
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
