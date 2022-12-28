local options = {
    {
        key = "StartingResources",
        name = "Starting Resources",
        desc = "Sets storage and amount of resources that players will start with",
        type = "section"
    },
    {
        key = "ta_modes",
        name = "Tech Annihilation - Game Modes",
        desc = "Tech Annihilation - Game Modes",
        type = "section"
    },
    {
        key = "ta_exp",
        name = "Tech Annihilation - Experimental Options",
        desc = "Tech Annihilation - Experimental Options",
        type = "section"
    },
    {
        key = "ta_options",
        name = "Tech Annihilation - Options",
        desc = "Tech Annihilation - Options",
        type = "section"
    },
    {
        key = "ta_wall_options",
        name = "Tech Annihilation - Wall Options",
        desc = "Tech Annihilation - Wall Options",
        type = "section"
    },
    {
        key = "chicken",
        name = "Chicken Defense Options",
        desc = "Chicken Spawner Options",
        type = "section"
    },
    {
        key = "cust",
        name = "Chicken Defense Custom Difficulty",
        desc = "Chicken Defense Custom Difficulty",
        type = "section"
    },
    {
        key = "mo_custom_burrowshp",
        name = "Burrow Hp",
        desc = "Set burrow hp\nAutoHost Usage :- mo_mo_custom_burrowshp",
        type = "number",
        def = 8600,
        min = 1,
        max = 10000000,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_preventcombomb",
        name = "Prevent Combombs",
        desc = "Commanders survive DGuns and other commanders explosions\nAutoHost USage :- mo_preventcombomb",
        type = "list",
        section = "ta_modes",
        def = "off",
        items = {
            {key = "hp", name = "Health", desc = "Commander with greatest hp survives comblast"},
            {key = "1v1", name = "1v1", desc = "Default Setting for 1v1 games"},
            {key = "off", name = "Off", desc = "Default engine Control"}
        }
    },
    {
        key = "mo_comgate",
        name = "Commander Teleport Effect",
        desc = "Commanders warp in at gamestart with a shiny teleport effect\nAutoHost USage :- mo_comgate",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_terraforming",
        name = "Terrain Terraform",
        desc = "Enable Terraforming map surface\nAutoHost USage :- mo_terraforming",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_ecorace",
        name = "Announces eco leader",
        desc = "Announces player with greatest E/M income every 2 min to all players\nAutoHost USage :- mo_ecorace",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_coop",
        name = "Cooperative Mode",
        desc = "Adds an extra commander for comsharing teams\nAutoHost Usage :- mo_coop",
        type = "bool",
        def = false,
        section = "ta_modes"
    },
    {
        key = "mo_greenfields",
        name = "No Metal Extraction",
        desc = "No metal extraction on any map\nAutoHost Usage :- mo_greenfields",
        type = "bool",
        def = false,
        section = "ta_modes"
    },
    {
        key = "mo_noowner",
        name = "FFA Mode",
        desc = "Units with no player control are instantly removed/destroyed\nAutoHost Usage :- mo_noowner",
        type = "bool",
        def = false,
        section = "ta_modes"
    },
    {
        key = "mo_progmines",
        name = "Progressive Mining",
        desc = "New mines take some time to become fully established, death resets progress\nAutoHost Usage :- mo_progmines",
        type = "bool",
        def = false,
        section = "ta_modes"
    },
    {
        key = "mo_preventdraw",
        name = "Commander Ends No Draw",
        desc = "Last Com alive is immune to comblast, D-gunning the last enemy Com with your last Com disqualifies you\nAutoHost Usage :- mo_preventdraw",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_startpoint_assist",
        name = "Startpoint Assist",
        desc = "Chooses sensible starting places for players/AIs who forgot to choose a startpoint for themselves\nAutoHost Usage :- mo_startpoint_assist",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_heatmap",
        name = "HeatMap",
        desc = "Attemps to prevents unit paths to cross",
        type = "bool",
        def = true,
        section = "ta_exp"
    },
    {
        key = "qtpfs",
        name = "Pathfinding system",
        desc = "Which pathfinding system to use\nAutoHost Usage :- qtpfs",
        type = "list",
        section = "ta_exp",
        def = "normal",
        items = {
            {key = "normal", name = "Default", desc = "Default Spring path finding engine"},
            {key = "qtpfs", name = "QTPFS", desc = "Quick/Tesellating Path Finding System"}
        }
    },
    {
        key = "mo_dynamic",
        name = "Dynamic Lighting",
        desc = "Toggles Dynamic lighing on or off\nAutoHost Usage :- mo_dynamic",
        type = "bool",
        def = true,
        section = "ta_options"
    },
    {
        key = "mo_noshare",
        name = "No Sharing To Enemies",
        desc = "Prevents players from giving units or resources to enemies\nAutoHost Usage :- mo_noshare",
        type = "bool",
        def = true,
        section = "ta_options"
    },
    {
        key = "mo_enemywrecks",
        name = "Show Enemy Wrecks",
        desc = "Gives you LOS of enemy wreckage\nAutoHost Usage :- mo_enemywrecks",
        type = "bool",
        def = true,
        section = "ta_options"
    },
    {
        key = "mo_allowfactionchange",
        name = "Allow Faction Change",
        desc = "Allows faction to be changed ingame\nAutoHost Usage :- mo_allowfactionchange",
        type = "bool",
        def = true,
        section = "ta_options"
    },
    {
        key = "mo_transportenemy",
        name = "Enemy Transporting",
        desc = "Toggle which enemy units you can kidnap with an air transport\nAutoHost Usage :- mo_transportenemy",
        type = "list",
        def = "none",
        section = "ta_options",
        items = {
            {key = "notcoms", name = "All But Commanders", desc = "Only commanders are immune to napping"},
            {key = "none", name = "Disallow All", desc = "No enemy units can be napped"}
        }
    },
    {
        key = "mo_comtranslock",
        name = "Locktime for Commanders in Transport's",
        desc = "Sets time lock for Transport of own Commanders\nAutoHost Usage :- comtranslock",
        section = "ta_options",
        type = "number",
        def = 0,
        min = 0,
        max = 25,
        step = 1 -- quantization is aligned to the def value
        -- (step <= 0) means that there is no quantization
    },
    {
        key = "mo_nowrecks",
        name = "No Unit Wrecks",
        desc = "Removes all unit wrecks from the game\nAutoHost Usage :- mo_nowrecks",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_nanoframedecay",
        name = "Disable nana frame decay",
        desc = "Stop nanoframe decaying over time\nAutoHost Usage :- mo_nanoframedecay",
        type = "bool",
        def = false,
        section = "ta_options"
    },
    {
        key = "mo_storageowner",
        name = "Team Storage Owner",
        desc = "What owns the starting resource storage\nAutoHost Usage :- mo_storageowner",
        type = "list",
        def = "team",
        section = "ta_options",
        items = {
            {
                key = "com",
                name = "Commander",
                desc = "Starting resource storage belongs to commander, is lost when commander dies"
            },
            {key = "team", name = "Team", desc = "Starting resource storage belongs to the team, cannot be lost"}
        }
    },
    {
        key = "deathmode",
        name = "Game End Mode",
        desc = "What it takes to eliminate a team\nAutoHost Usage :- deathmode",
        type = "list",
        def = "com",
        section = "ta_modes",
        items = {
            {key = "neverend", name = "None", desc = "Teams are never eliminated"},
            {key = "com", name = "Kill all enemy Commanders", desc = "When a team has no Commanders left, it loses"},
            {key = "killall", name = "Kill everything", desc = "Every last unit must be eliminated, no exceptions!"}
        }
    },
    {
        key = "mo_no_close_spawns",
        name = "No close spawns",
        desc = "Prevents players startpoints being placed close together (on large enough maps)\nAutoHost Usage :- mo_no_close_spawns",
        type = "bool",
        def = true,
        section = "ta_options"
    },
    {
        key = "shareddynamicalliancevictory",
        name = "Dynamic Ally Victory",
        desc = "Ingame alliance should count for game over condition\nAutoHost Usage :- shareddynamicalliancevictory",
        type = "bool",
        def = false,
        section = "ta_modes"
    },
    {
        key = "startmetal",
        name = "Starting metal",
        desc = "Determines amount of metal and metal storage that each player will start with\nAutoHost Usage :- startmetal",
        type = "number",
        section = "StartingResources",
        def = 1000,
        min = 0,
        max = 1000000,
        step = 1 -- quantization is aligned to the def value
        -- (step <= 0) means that there is no quantization
    },
    {
        key = "startenergy",
        name = "Starting energy",
        desc = "Determines amount of energy and energy storage that each player will start with\nAutoHost Usage :- startenergy",
        type = "number",
        section = "StartingResources",
        def = 1000,
        min = 0,
        max = 1000000,
        step = 1 -- quantization is aligned to the def value
        -- (step <= 0) means that there is no quantization
    },
    {
        key = "mo_wall",
        name = "The Wall",
        desc = "Add Dividing Wall with Countdown\nAutoHost Usage :- mo_wall",
        type = "bool",
        def = false,
        section = "ta_wall_options"
    },
    {
        key = "wall_time",
        name = "Wall Time",
        desc = "How many minutes will the wall divide the teams?\nAutoHost Usage :- wall_time",
        section = "ta_wall_options",
        type = "number",
        min = 0,
        max = 30,
        step = 1,
        def = 10
    },
    {
        key = "wall_size",
        name = "Wall Size",
        desc = "How many percent of the map will each team get at start?\nAutoHost Usage :- wall_size",
        section = "ta_wall_options",
        type = "number",
        min = 10,
        max = 45,
        step = 1,
        def = 45
    },
    {
        key = "wall_los",
        name = "Line of Sight",
        desc = "Can you see past the wall?\nAutoHost Usage :- wall_los",
        section = "ta_wall_options",
        type = "list",
        def = "1",
        items = {
            {
                key = "0",
                name = "normal LOS rules",
                desc = "everything works as expected."
            },
            {
                key = "1",
                name = "Full LOS",
                desc = "You can see enemy units, everywhere."
            },
            {
                key = "2",
                name = "Blindness",
                desc = "You can not see enemy units at all."
            }
        }
    },
    {
        key = "wall_weapons",
        name = "Cease-Fire",
        desc = "Are weapons blocked as long as the wall remains?\nAutoHost Usage :- wall_weapons",
        section = "ta_wall_options",
        type = "list",
        def = "1",
        items = {
            {
                key = "1",
                name = "Yes",
                desc = "No unit can shoot until the timer is up."
            },
            {
                key = "2",
                name = "No",
                desc = "Units can shot as normal."
            }
        }
    },
    {
        key = "mo_chickenstart",
        name = "Burrow Placement",
        desc = "Control where burrows spawn",
        type = "list",
        def = "alwaysbox",
        section = "chicken",
        items = {
            {key = "anywhere", name = "Anywhere", desc = "Burrows can spawn anywhere"},
            {key = "avoid", name = "Avoid Players", desc = "Burrows do not spawn on player units"},
            {
                key = "initialbox",
                name = "Initial Start Box",
                desc = "First wave spawns in chicken start box, following burrows avoid players"
            },
            {key = "alwaysbox", name = "Always Start Box", desc = "Burrows always spawn in chicken start box"}
        }
    },
    {
        key = "mo_queendifficulty",
        name = "Queen Difficulty",
        desc = "How hard doth the Chicken Queen",
        type = "list",
        def = "h_chickenq",
        section = "chicken",
        items = {
            {key = "ve_chickenq", name = "Very Easy", desc = "Cakewalk"},
            {key = "e_chickenq", name = "Easy", desc = "Somewhat Challenging"},
            {key = "n_chickenq", name = "Normal", desc = "A Good Challenge"},
            {key = "h_chickenq", name = "Hard", desc = "Serious Business"},
            {key = "vh_chickenq", name = "Very Hard", desc = "Impossible"},
            {key = "fh_chickenq", name = "Fricking Hard", desc = "Insane"}
        }
    },
    {
        key = "mo_queentime",
        name = "Max Queen Arrival (Minutes)",
        desc = "Queen will spawn after given time.",
        type = "number",
        def = 40,
        min = 1,
        max = 90,
        step = 1,
        section = "chicken"
    },
    {
        key = "mo_maxage",
        name = "Chicken max age",
        desc = "Maximum chicken age in seconds.",
        type = "number",
        def = 600,
        min = 150,
        max = 1200,
        step = 10,
        section = "chicken"
    },
    {
        key = "mo_graceperiod",
        name = "Grace Period (Seconds)",
        desc = "Time before chickens become active.",
        type = "number",
        def = 600,
        min = 10,
        max = 3600,
        step = 10,
        section = "chicken"
    },
    {
        key = "mo_aa_units",
        name = "Robot AA Units",
        desc = "Allows or disallows the robot(s) to spawn AA Units",
        type = "bool",
        def = true,
        section = "chicken"
    },
    {
        key = "mo_queenanger",
        name = "Add Queen Anger",
        desc = "Killing burrows adds to queen anger.",
        type = "bool",
        def = true,
        section = "chicken"
    },
    {
        key = "mo_gracepenalty",
        name = "Grace Penalty",
        desc = "Grace Penalty add more robots if grace time is bigger than 270sec",
        type = "bool",
        def = true,
        section = "cust"
    },
    {
        key = "mo_custom_burrowspawn",
        name = "Burrow Spawn Rate (Seconds)",
        desc = "Time between burrow spawns.",
        type = "number",
        def = 120,
        min = 1,
        max = 600,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_custom_numwaves",
        name = "Number of waves to spawn",
        desc = "Robots will spawn then in queentime / numwaves",
        type = "number",
        def = 11,
        min = 2,
        max = 200,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_custom_maxchicken",
        name = "Robot limit per Team",
        desc = "Maximum number of robots on map per Team.",
        type = "number",
        def = 60,
        min = 1,
        max = 1000,
        step = 10,
        section = "cust"
    },
    {
        key = "mo_custom_minchicken",
        name = "Min Robots per Team",
        desc = "Minimum Number of robots before spawn chance kicks in",
        type = "number",
        def = 8,
        min = 1,
        max = 250,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_custom_spawnchance",
        name = "Spawn Chance (Percent)",
        desc = "Percent chance of each chicken spawn once greater thwn the min chickens per player limit",
        type = "number",
        def = 33,
        min = 0,
        max = 100,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_custom_angerbonus",
        name = "Burrow Kill Anger (Seconds)",
        desc = "Seconds added per burrow kill.",
        type = "number",
        def = 0.15,
        min = 0,
        max = 100,
        step = 0.01,
        section = "cust"
    },
    {
        key = "mo_custom_cost_multiplier",
        name = "Cost multiplier for cost of units",
        desc = "The higher the number the faster you get stronger units",
        type = "number",
        def = 1,
        min = 0,
        max = 100,
        step = 0.01,
        section = "cust"
    },
    {
        key = "mo_custom_kingmaxunits",
        name = "Max units spawned by the king (* num of teams)",
        desc = "Number of units spawned by the king at once. (* num of teams)",
        type = "number",
        def = 8,
        min = 0,
        max = 250,
        step = 1,
        section = "cust"
    },
    {
        key = "mo_custom_expstep",
        name = "Bonus Experience",
        desc = "Exp each chicken will receive by the end of the game",
        type = "number",
        def = 1.5,
        min = 0,
        max = 2.5,
        step = 0.1,
        section = "cust"
    },
    {
        key = "mo_custom_damagemod",
        name = "Damage Mod",
        desc = "Multipler for robot damage",
        type = "number",
        def = 1.5,
        min = 0.1,
        max = 10,
        step = 0.1,
        section = "cust"
    }
}
return options
