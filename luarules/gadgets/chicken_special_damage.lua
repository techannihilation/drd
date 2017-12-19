--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function gadget:GetInfo()
  return {
    name      = "Chicken Special Damage",
    desc      = "Nerfs some weapons vs Chickens",
    author    = "TheFatController",
    date      = "Aug 31, 2013",
    license   = "GNU GPL, v2 or later",
    layer     = 0,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not gadgetHandler:IsSyncedCode()) then
  return false  --  silent removal
end

local DAMAGE_LIMITS = {
}

local DGUN = {
  [WeaponDefNames['armcom_arm_disintegrator'].id] = 15000,
  [WeaponDefNames['armcom1_arm_disintegrator'].id] = 15000,
  [WeaponDefNames['armcom4_arm_disintegrator1'].id] = 15000,
  [WeaponDefNames['armcom5_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['armcom6_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['armcom7_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['corcom_arm_disintegrator'].id] = 15000,
  [WeaponDefNames['corcom1_arm_disintegrator'].id] = 15000,
  [WeaponDefNames['corcom3_arm_disintegrator1'].id] = 15000,
  [WeaponDefNames['corcom5_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['corcom6_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['corcom7_arm_disintegrator2'].id] = 15000,
  [WeaponDefNames['tllcom_arm_disintegrator3'].id] = 15000,
  [WeaponDefNames['tllcom1_arm_disintegrator'].id] = 15000,
  [WeaponDefNames['tllcom3_tll_disintegrator1'].id] = 15000,
  [WeaponDefNames['tllcom5_tll_disintegrator2'].id] = 15000,
  [WeaponDefNames['tllcom6_tll_disintegrator2'].id] = 15000,
  [WeaponDefNames['tllcom7_tll_disintegrator2'].id] = 15000
}

local CHICKEN_RESISTS = {
	[UnitDefNames['chickenp1'].id] = {
		[WeaponDefNames['cormaw_dmaw'].id] = 0.4,
		[WeaponDefNames['corpyro_flamethrower'].id] = 0.4,
		[WeaponDefNames['corhurc_coradvbomb'].id] = 0.75,
		[WeaponDefNames['cortermite_core_termite_laser'].id] = 0.75,
		[WeaponDefNames['corkrog_corkrog_fire'].id] = 0.75,
	},
	[UnitDefNames['chickenc1'].id] = {
		[WeaponDefNames['armclaw_dclaw'].id] = 0.6,
		[WeaponDefNames['armzeus_lightning'].id] = 0.6,
		[WeaponDefNames['armlatnk_armlatnk_weapon'].id] = 0.6,
		[WeaponDefNames['armbanth_armbantha_fire'].id] = 0.6,
	},
	[UnitDefNames['chickenc3'].id] = {
		[WeaponDefNames['armclaw_dclaw'].id] = 0.5,
		[WeaponDefNames['armzeus_lightning'].id] = 0.5,
		[WeaponDefNames['armlatnk_armlatnk_weapon'].id] = 0.5,
		[WeaponDefNames['armbanth_armbantha_fire'].id] = 0.5,
	},
	[UnitDefNames['chickenc3b'].id] = {
		[WeaponDefNames['armclaw_dclaw'].id] = 0.5,
		[WeaponDefNames['armzeus_lightning'].id] = 0.5,
		[WeaponDefNames['armlatnk_armlatnk_weapon'].id] = 0.5,
		[WeaponDefNames['armbanth_armbantha_fire'].id] = 0.5,
	},
	[UnitDefNames['chickenc3b'].id] = {
		[WeaponDefNames['armclaw_dclaw'].id] = 0.5,
		[WeaponDefNames['armzeus_lightning'].id] = 0.5,
		[WeaponDefNames['armlatnk_armlatnk_weapon'].id] = 0.5,
		[WeaponDefNames['armbanth_armbantha_fire'].id] = 0.5,
	},
	[UnitDefNames['chickenh5'].id] = {
		[WeaponDefNames['corvipe_vipersabot'].id] = 0.5,
		[WeaponDefNames['armpb_armpb_weapon'].id] = 0.5,
	},
	[UnitDefNames['chicken2b'].id] = {
		[WeaponDefNames['cordoom_atadr'].id] = 0.666,
		[WeaponDefNames['armanni_ata'].id] = 0.666,
	},
}

function gadget:UnitPreDamaged(unitID, unitDefID, unitTeam, damage, paralyzer, 
                            weaponID, projectileID, attackerID, attackerDefID, attackerTeam)
  
  if CHICKEN_RESISTS[unitDefID] and CHICKEN_RESISTS[unitDefID][weaponID] then
	return damage * CHICKEN_RESISTS[unitDefID][weaponID], CHICKEN_RESISTS[unitDefID][weaponID]
  end     
  
  if DAMAGE_LIMITS[weaponID] then
		return math.min(DAMAGE_LIMITS[weaponID],damage),1
  elseif (DGUN[weaponID] and (string.find(UnitDefs[unitDefID].name, "chickenq") ~= nil)) then
		return math.min(DGUN[weaponID],damage),1
  elseif ((damage > 50000) and (string.find(UnitDefs[unitDefID].name, "chickenq") ~= nil)) then
		return math.min(50000,damage),1
  else
		return damage,1
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
