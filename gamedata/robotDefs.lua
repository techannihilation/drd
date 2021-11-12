local function DeepCopy(orig)
	local orig_type = type(orig)
	local copy

	if orig_type == "table" then
		copy = {}

		for orig_key, orig_value in next, orig, nil do
			copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
		end

		setmetatable(copy, DeepCopy(getmetatable(orig)))
	else
		copy = orig
	end

	return copy
end

local MoveDefs = DeepCopy(DEFS.moveDefs)
local UnitDefs = DeepCopy(DEFS.unitDefs)
local WeaponDefs = DeepCopy(DEFS.weaponDefs)
local ArmorDefs = DeepCopy(DEFS.weaponDefs)
local FeatureDefs = DeepCopy(DEFS.featureDefs)

-----------------------------------------------------------

----------------Robot MoveDefs Processing -----------------
local moveDatas = {
	ROBOTKING = {
		depthmod = 0,
		footprintx = 9,
		footprintz = 9,
		maxwaterdepth = 400,
		maxslope = 80,
		crushstrength = 600000
	}
}

for name, data in pairs(moveDatas) do
	data.name = name
	MoveDefs[#MoveDefs + 1] = data
end

-----------------------------------------------------------

----------------Robot ArmorDefs Processing ----------------
local armorDatas = {
	-- tinychicken = {
	-- 	"chickenh1",
	-- 	"chickenh1b"
	-- },
	-- chicken = {
	-- 	"e_chickenqr",
	-- 	"fh_chickenqr",
	-- 	"h_chickenqr",
	-- 	"n_chickenqr",
	-- 	"ve_chickenqr",
	-- 	"vh_chickenqr",
	-- 	"rroost"
	-- }
}

for name, data in pairs(armorDatas) do
	data.name = name
	ArmorDefs[#ArmorDefs + 1] = data
end
-----------------------------------------------------------

DEFS.moveDefs = MoveDefs
DEFS.unitDefs = UnitDefs
DEFS.weaponDefs = WeaponDefs
DEFS.armorDefs = ArmorDefs
DEFS.featureDefs = FeatureDefs