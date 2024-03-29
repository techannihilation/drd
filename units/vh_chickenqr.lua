-- UNITDEF -- VH_CHICKENQR --
--------------------------------------------------------------------------------

local unitName = "vh_chickenqr"

--------------------------------------------------------------------------------

local unitDef = {
	acceleration = 0.666,
	brakerate = 1.215,
	autoHeal = 33.33,
	activateWhenBuilt = true,
	airSightDistance = 2400,
	bmcode = 1,
	buildCostEnergy = 2666666,
	buildCostMetal = 666666,
	buildTime = 3666666,
	canAttack = true,
	canGuard = true,
	canMove = true,
	canPatrol = true,
	canstop = 1,
	cantBeTransported = false,
	capturable = false,
	category = "ALL HUGE MOBILE NOTDEFENSE NOTHOVERSURFACE NOTSUB NOTSUBNOTSHIP SURFACE SURFACE",
	collisionvolumeoffsets = "0 0 -4",
	collisionvolumescales = "300 400 208",
	collisionvolumetest = 0,
	collisionvolumetype = "Ell",
	corpse = "dead",
	damageModifier = 0.666,
	defaultmissiontype = "Standby",
	description = "All Robots Lord and Master",
	energyMake = 666666,
	energyStorage = 6666666,
	energyUse = 0,
	explodeAs = "TSAR_DEATH",
	firestandorders = 1,
	footprintX = 9,
	footprintZ = 9,
	iconType = "krogoth",
	idleTime = 900,
	immunetoparalyzer = 1,
	maneuverleashlength = 666,
	mass = 6666666666,
	maxDamage = 12000000,
	maxSlope = 128,
	maxVelocity = 1.666,
	maxWaterDepth = 666,
	maxRange = 666,
	metalMake = 6666.66,
	metalStorage = 6666.66,
	mobilestandorders = 1,
	movementClass = "VKBOT12",
	name = "Robot King",
	noAutoFire = false,
	noChaseCategory = "VTOL",
	objectName = "fh_chickenqr",
	pushResistant = true,
	radarDistance = 2666,
	reclaimable = false,
	script = "fh_chickenqr.cob",
	selfDestructAs = "TSAR_DEATH",
	side = "ARM",
	sightDistance = 2066.6,
	standingfireorder = 2,
	standingmoveorder = 1,
	steeringmode = 2,
	turninplace = 0,
	turnRate = 1450, -- pyro
	unitname = "vh_chickenqr",
	upright = true,
	customparams = {
		paralyzemultiplier = 0,
		shield_emit_height = 75,
		shield_power = 6666,
		shield_radius = 333,
	},
	featureDefs = nil,
	sfxtypes = {
		explosiongenerators = {
			[1] = "custom:EyesWhite",
			[2] = "custom:EyesRed",
		},
	},
	sounds = {
		canceldestruct = "cancel2",
		underattack = "warning1",
		arrived = {
			[1] = "orcthere",
		},
		cant = {
			[1] = "cantdo4",
		},
		count = {
			[1] = "count6",
			[2] = "count5",
			[3] = "count4",
			[4] = "count3",
			[5] = "count2",
			[6] = "count1",
		},
		ok = {
			[1] = "krogok1",
		},
		select = {
			[1] = "krogsel1",
		},
	},
	weaponDefs = nil,
	weapons = {
		[1] = {
			badTargetCategory = "TINY",
			def = "RK_CANNON",
			onlyTargetCategory = "SURFACE",
		},
		[2] = {
			badTargetCategory = "TINY",
			def = "RK_CANNON",
			onlyTargetCategory = "SURFACE",
		},
		[3] = {
			def = "CORE_ULTIMATE_FLAK", -- coruflak
			onlyTargetCategory = "VTOL",
		},
		[4] = {
			def = "CORE_ULTIMATE_FLAK",
			onlyTargetCategory = "VTOL",
		},
		[5] = {
			badTargetCategory = "TINY SMALL",
			def = "ATADR10", -- cordoom1
			mainDir = "-0.3 0 1",
			maxAngleDif = 120,
			onlyTargetCategory = "SURFACE",
		},
		[6] = {
			badTargetCategory = "TINY SMALL",
			def = "ATADR10",
			mainDir = "0.3 0 1",
			maxAngleDif = 120,
			onlyTargetCategory = "SURFACE",
		},
		[7] = {
			def = "flammer_weapon",
			mainDir = "-0.3 0 1",
			maxAngleDif = 170,
			onlyTargetCategory = "SURFACE",
		},
		[8] = {
			def = "flammer_weapon",
			mainDir = "0.3 0 1",
			maxAngleDif = 170,
			onlyTargetCategory = "SURFACE",
		},
		[9] = {
			badTargetCategory = "TINY SMALL",
			def = "cannon_siege",
			onlyTargetCategory = "SURFACE",
		},
		[10] = {
			badTargetCategory = "TINY SMALL MEDIUM",
			def = "RKEyeCannon",
			onlyTargetCategory = "SURFACE",
		},
		[11] = {
			def = "KROGCRUSH1",
			mainDir = "0 0 1",
			maxAngleDif = 200,
			onlyTargetCategory = "SURFACE",
		},
		[12] = {
			def = "shield",
		},
	},
}

--------------------------------------------------------------------------------

local weaponDefs = {
	core_ultimate_flak = {
		accuracy = 500,
		areaofeffect = 384,
		avoidfeature = false,
		burnblow = true,
		cegtag = "corflak-fx",
		craterareaofeffect = 512,
		craterboost = 0,
		cratermult = 0,
		edgeeffectiveness = 0.5,
		explosiongenerator = "custom:FLASH3",
		gravityaffected = "TRUE",
		impulseboost = 0,
		impulsefactor = 0,
		name = "Core Ultimate Flak",
		noselfdamage = true,
		range = 1333,
		reloadtime = 0.75,
		rgbcolor = "1 0.3 0.2",
		soundhitdry = "flakhit",
		soundhitwet = "splslrg",
		soundhitwetvolume = 1.0,
		soundstart = "ultimateflakfire",
		turret = true,
		weapontimer = 1,
		weapontype = "Cannon",
		weaponvelocity = 1550,
		damage = {
			areoship = 12000,
			default = 5,
			priority_air = 48000,
			unclassed_air = 48000,
		},
	},
	atadr10 = { -- cordoom1 + reloadtime / 2 + dmg boost
		areaofeffect = 52,
		beamtime = 0.4,
		corethickness = 0.32,
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		energypershot = 10000,
		explosiongenerator = "custom:FLASH4blue",
		impulseboost = 0,
		impulsefactor = 0,
		laserflaresize = 22,
		name = "Doomsday Main Weapon",
		noselfdamage = true,
		range = 1333,
		reloadtime = 4,
		rgbcolor = "0.2 0.2 1",
		soundhitdry = "",
		soundhitwet = "sizzle",
		soundhitwetvolume = 0.5,
		soundstart = "annigun1",
		soundtrigger = 1,
		sweepfire = false,
		targetmoveerror = 0.3,
		thickness = 7,
		turret = true,
		weapontype = "BeamLaser",
		weaponvelocity = 1500,
		customparams = {
			light_mult = 1.8,
			light_radius_mult = 1.2,
		},
		damage = {
			commanders = 4000,
			default = 24000,
		},
	},
	cannon_siege = {
		accuracy = 100,
		areaofeffect = 450,
		avoidfeature = false,
		cegtag = "Trail_cannon_med",
		craterareaofeffect = 600,
		craterboost = 0,
		cratermult = 0,
		energypershot = 12500,
		explosiongenerator = "custom:FLASHNUKE480",
		gravityaffected = "TRUE",
		impulseboost = 0.123,
		impulsefactor = 0.123,
		name = "Talon Repentance Plasma Cannon",
		nogap = 1,
		noselfdamage = true,
		range = 1333,
		reloadtime = 12,
		rgbcolor = "0.88 0.65 0",
		separation = 0.45,
		size = 5,
		sizedecay = -0.15,
		soundhitdry = "bellhit",
		soundhitwet = "splslrg",
		soundhitwetvolume = 1,
		soundstart = "xplomed5",
		stages = 20,
		turret = true,
		weapontype = "Cannon",
		weaponvelocity = 450,
		damage = {
			commanders = 1800,
			default = 36000,
		},
	},
	flammer_weapon = {
		areaofeffect = 150,
		avoidfeature = false,
		burst = 22,
		burstrate = 0.01,
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		firestarter = 100,
		flamegfxtime = 1,
		groundbounce = true,
		impulseboost = 0,
		impulsefactor = 0,
		intensity = 0.6,
		name = "Boosted GOK Ifrit Flamer",
		noselfdamage = true,
		range = 800,
		reloadtime = 0.6,
		rgbcolor = "1 0.95 0.9",
		rgbcolor2 = "0.9 0.85 0.8",
		sizegrowth = 1.1,
		soundhitwet = "sizzle",
		soundhitwetvolume = 0.5,
		soundstart = "Flamhvy1",
		soundtrigger = false,
		sprayangle = 9600,
		targetMoveError = 0.001,
		tolerance = 2500,
		turret = true,
		weapontimer = 1,
		weapontype = "Flame",
		weaponvelocity = 450,
		damage = {
			default = 750             ,
		},
	},
	KROGCRUSH1 = { -- what is that?
		areaOfEffect = 150,
		collideFriendly = true,
		craterBoost = 0,
		craterMult = 0,
		explosionGenerator = "custom:KROGCRUSHE",
		impulseBoost = 0.234,
		impulseFactor = 0.234,
		intensity = 0,
		metalpershot = 0,
		name = "SuperKrogCrush",
		noSelfDamage = true,
		range = 155,
		reloadtime = 0.75,
		rgbColor = "0 0 0",
		thickness = 0,
		tolerance = 100,
		turret = true,
		weaponTimer = 0.1,
		weaponType = "Cannon",
		weaponVelocity = 650,
		damage = {
			default = 1000,
		},
	},
	RK_CANNON = { -- Hands cannon
		accuracy = 100,
		areaOfEffect = 166.6,
		avoidFeature = false,
		avoidFriendly = true,
		beamTime = 0.1666,
		cegTag = "bluelight",
		coreThickness = 0.666,
		craterBoost = 0.123,
		craterMult = 0.123,
		duration = 0.1,
		edgeEffectiveness = 0.25,
		energypershot = 6666,
		explosionGenerator = "custom:particleboom",
		impulseBoost = 0.123,
		impulseFactor = 1,
		name = "Mega Particle Cannon",
		noSelfDamage = true,
		range = 1333,
		reloadtime = 0.666,
		rgbColor = "0 0 0.666",
		rgbColor2 = "0.666 0.666 1",
		soundHit = "xplomed2",
		soundHitVolume = 8,
		soundStart = "Orcfire",
		thickness = 17,
		tolerance = 1666,
		turret = true,
		weaponType = "LaserCannon",
		weaponVelocity = 2666,
		damage = {
			commanders = 666,
			default = 6000,
		},
	},
	RKEyeCannon = {
		areaofeffect = 366.6,
		avoidfriendly = false,
		beamtime = 1.666,
		corethickness = 0.666,
		craterareaofeffect = 0,
		craterboost = 0,
		cratermult = 0,
		energypershot = 2666,
		explosiongenerator = "custom:DIESMALL",
		firestarter = 66.6,
		impulseboost = 0,
		impulsefactor = 0,
		largebeamlaser = true,
		laserflaresize = 16.66,
		name = "Core Super Krog Ultimate Beam",
		noselfdamage = true,
		range = 1333,
		reloadtime = 3.666,
		rgbcolor = "1 0 0",
		soundhitdry = "",
		soundhitwet = "sizzle",
		soundhitwetvolume = 0.5,
		soundstart = "BFG__X1B",
		soundtrigger = 1,
		sweepfire = false,
		texture1 = "Type4Beam",
		texture2 = "NULL",
		texture3 = "NULL",
		texture4 = "EMG",
		thickness = 25,
		tolerance = 5000,
		turret = true,
		weapontype = "BeamLaser",
		weaponVelocity = 1666,
		customparams = {
			light_mult = 1.8,
			light_radius_mult = 1.2,
		},
		damage = {
			commanders = 3750,
			default = 60000,
		},
	},
	shield = { -- 8 x talon_pyramid
		name = "8 x Pyramid Absorb Shield",
		shieldbadcolor = "1 0.2 0.2 0.30",
		shieldenergyuse = 1666,
		shieldforce = 8,
		shieldgoodcolor = "0.1 0.3 0.9 0.30",
		shieldintercepttype = 31,
		shieldpower = 1200000,
		shieldpowerregen = 12000,
		shieldpowerregenenergy = 6000,
		shieldradius = 333,
		shieldrepulser = false,
		smartshield = true,
		visibleshield = true,
		visibleshieldrepulse = true,
		weapontype = "Shield",
		damage = {
			default = 100,
		},
	},
}
unitDef.weaponDefs = weaponDefs


--------------------------------------------------------------------------------

local featureDefs = {
	Dead = {
		blocking = true,
		category = "corpses",
		damage = 0.0444 * unitDef.maxDamage,
		description = unitDef.name .. "Wrecked ",
		featureDead = "fallen",
		featurereclamate = "smudge01",
		footprintX = 12,
		footprintZ = 12,
		height = 190,
		hitdensity = 100,
		metal = 0.6000 * unitDef.buildCostMetal,
		object = "fh_chickenqr_dead",
		reclaimable = true,
		seqnamereclamate = "tree1reclamate",
		world = "All Worlds",
	},
	fallen = {
		blocking = true,
		category = "corpses",
		damage = 106666,
		description = "Fallen Robot King",
		featureDead = "heap",
		featurereclamate = "smudge01",
		footprintX = 12,
		footprintZ = 15,
		height = 100,
		hitdensity = 100,
		metal = 240000,
		object = "fh_chickenqr_fallen",
		reclaimable = true,
		seqnamereclamate = "tree1reclamate",
		world = "All Worlds",
	},
	heap = {
		blocking = false,
		category = "heaps",
		damage = 0.0071 * unitDef.maxDamage,
		description = unitDef.name .. " Heap",
		featurereclamate = "smudge01",
		footprintX = 7,
		footprintZ = 7,
		height = 4,
		hitdensity = 100,
		metal = 0.1422 * unitDef.buildCostMetal,
		object = "7x7d",
		reclaimable = true,
		seqnamereclamate = "tree1reclamate",
		world = "All Worlds",
	},
}
unitDef.featureDefs = featureDefs

--------------------------------------------------------------------------------

return lowerkeys({[unitName] = unitDef})

--------------------------------------------------------------------------------
