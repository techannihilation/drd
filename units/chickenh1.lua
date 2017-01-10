-- UNITDEF -- CHICKENH1 --
--------------------------------------------------------------------------------

local unitName = "chickenh1"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.05,
	activateWhenBuilt = true,
	bmcode = 1,
	brakeRate = 0.2,
	buildCostEnergy = 600,
	buildCostMetal = 40,
	builddistance = 120,
	builder = 1,
	buildPic = [[chicken_drone.png]],
	buildTime = 600,
	canassist = 0,
	canbuild = 1,
	canGuard = 1,
	canMove = 1,
	canPatrol = 1,
	canRepair = 1,
	canstop = 1,
	category = [[TINY MOBILE NOTHOVERNOTVTOL WEAPON NOTVTOL NOTSUB NOTSHIP ALL]],
	collide = 0,
	collisionVolumeOffsets = [[0 -1 0]],
	collisionVolumeScales = [[10 14 22]],
	collisionVolumeType = [[box]],
	defaultmissiontype = [[Standby]],
	description = [[Chicken Healer]],
	energymake = 25,
	explodeAs = [[WEAVER_DEATH]],
	floater = false,
	footprintX = 1,
	footprintZ = 1,
	hidedamage = 1,
	iconType = [[builder]],
	idleAutoHeal = 15,
	idleTime = 0,
	kamikaze = true,
	kamikazeDistance = 60,
	leaveTracks = true,
	maneuverleashlength = 640,
	mass = 14,
	maxDamage = 225,
	maxSlope = 18,
	maxVelocity = 2.3,
	maxWaterDepth = 5000,
	mobilestandorders = 1,
	movementClass = [[KBOT2]],
	name = [[Weaver]],
	noAutoFire = 0,
	objectName = [[chicken_drone.s3o]],
	repairspeed = 225,
	seismicSignature = 1,
	selfDestructAs = [[WEAVER_DEATH]],
	side = [[THUNDERBIRDS]],
	sightDistance = 256,
	smoothAnim = true,
	standingmoveorder = 1,
	stealth = 1,
	steeringmode = [[2]],
	trackOffset = 1,
	trackStrength = 6,
	trackStretch = 1,
	trackType = [[ChickenTrack]],
	trackWidth = 10,
	turninplace = 0,
	turnRate = 468,
	unitname = [[chickenh1]],
	upright = false,
	waterline = 8,
	workertime = 225,
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
