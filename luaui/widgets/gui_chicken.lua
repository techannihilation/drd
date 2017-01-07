-- $Id$
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:GetInfo()
  return {
    name      = "Chicken Panel",
    desc      = "Shows stuff",
    author    = "quantum",
    date      = "May 04, 2008",
    license   = "GNU GPL, v2 or later",
    layer     = -9,
    enabled   = true  --  loaded by default?
  }
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

if (not Spring.GetGameRulesParam("difficulty")) then
  return false
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

local GetTimer        = Spring.GetTimer
local DiffTimers      = Spring.DiffTimers
local lastRulesUpdate = Spring.GetTimer()
local GetGameSeconds  = Spring.GetGameSeconds
local GetGameRulesParam = Spring.GetGameRulesParam
local Spring          = Spring
local gl, GL          = gl, GL
local widgetHandler   = widgetHandler
local math            = math
local table           = table

local displayList
local fontHandler     = loadstring(VFS.LoadFile(LUAUI_DIRNAME.."modfonts.lua", VFS.ZIP_FIRST))()
local panelFont       = LUAUI_DIRNAME.."Fonts/FreeSansBold_14"
local waveFont        = LUAUI_DIRNAME.."Fonts/Skrawl_40"
local panelTexture

local viewSizeX, viewSizeY = 0,0
local w               = 300
local h               = 210
local x1              = - w - 50
local y1              = - h - 50
local panelMarginX    = 30
local panelMarginY    = 40
local panelSpacingY   = 7
local waveSpacingY    = 7
local moving
local capture
local gameInfo
local waveY           = 800
local waveSpeed       = 0.2
local waveCount       = 0
local waveTime
local waveTimer
local enabled
local gotScore
local scoreCount	  = 0
local queenAnger     = 0

local guiPanel --// a displayList
local updatePanel
local hasChickenEvent = false


local side
local aifaction
local cenabled = tonumber(Spring.GetModOptions().mo_norobot) or 0
    if (cenabled == 1) then
      side = "Queen"
      aifaction = "Chicken's"
      panelTexture    = ":n:"..LUAUI_DIRNAME.."Images/panel.tga"
    else
      side = "King"
      aifaction = "Robot's"
      panelTexture    = ":n:"..LUAUI_DIRNAME.."Images/panel.tga" -- todo make panel for robot mode
    end


local red             = "\255\255\001\001"
local white           = "\255\255\255\255"

local difficulties = {
    [1] = 'Very Easy',
    [2] = 'Easy',
    [3] = 'Normal',
    [4] = 'Hard',
    [5] = 'Very Hard',
    [6] = 'Insane',
    [7] = 'Custom',
    [8] = 'Survival',
}

local rules = {}



local waveColors = {}
waveColors[1] = "\255\184\100\255"
waveColors[2] = "\255\120\50\255"
waveColors[3] = "\255\255\153\102"
waveColors[4] = "\255\120\230\230"
waveColors[5] = "\255\100\255\100"
waveColors[6] = "\255\150\001\001"
waveColors[7] = "\255\255\255\100"
waveColors[8] = "\255\100\255\255"
waveColors[9] = "\255\100\100\255"
waveColors[10] = "\255\200\050\050"
waveColors[11] = "\255\255\255\255"

local chickenColors
if (cenabled == 1) then
rules = {
  "queenTime",
  "queenAnger",
  "gracePeriod",
  "queenLife",
  "lagging",
  "difficulty",
  "chickenCount",
  "chickenaCount",
  "chickensCount",
  "chickenfCount",
  "chickenrCount",
  "chickenwCount",
  "chickencCount",
  "chickenpCount",
  "chickenhCount",
  "chickendCount",
  "chicken_dodoCount",
  "roostCount",
  "chickenKills",
  "chickenaKills",
  "chickensKills",
  "chickenfKills",
  "chickenrKills",
  "chickenwKills",
  "chickencKills",
  "chickenpKills",
  "chickenhKills",
  "chickendKills",
  "chicken_dodoKills",
  "roostKills",
}

chickenColors = {
  {"chicken",      "\255\184\100\255"},
  {"chickena",     "\255\255\100\100"},
  {"chickenh",     "\255\255\150\150"},
  {"chickens",     "\255\100\255\100"},
  {"chickenw",     "\255\184\075\200"},
  {"chicken_dodo", "\255\150\001\001"},
  {"chickenp",     "\255\250\090\090"},
  {"chickenf",     "\255\255\255\100"},
  {"chickenc",     "\255\100\255\255"},
  {"chickenr",     "\255\100\100\255"},
}

else
  rules = {
  "queenTime",
  "queenAnger",
  "gracePeriod",
  "queenLife",
  --"lagging",
  "difficulty",

  "armrlCount",
  "armrlKills",

  "armflakCount",
  "armflakKills",

  "arm_big_berthaCount",
  "arm_big_berthaKills",

  "armbrtha1lCount",
  "armbrtha1Kills",

  "tlldbCount",
  "tlldbKills",

  "armshock1Count",
  "cormist1Count",
  "cormortCount",
  "armravenCount",
  "armsam1Count",
  "armthundCount",
  "corcrwCount",
  "armfleaCount",
  "marauderCount",
  "corkrogCount",
  "corhurcCount",
  "armflash1Count",
  "armmerlCount",
  "corgalaCount",
  "hyperionCount",
  "armtarantulaCount",
  "armorionCount",
  "armfastCount",
  "tllmatamataCount",
  "tllmatamataKills",
  "armcybrCount",
  "tllcrawlbCount",
  "armzeusCount",
  "abroadsideCount",
  "corragCount",
  "corprotCount",
  "corgolCount",
  "armraven1Count",
  "anvilCount",
  "tllvaliantCount",
  "armflashCount",
  "armblzCount",
  "arm_furieCount",
  "armjanus1Count",
  "armpraetCount",
  "corpyroCount",
  "armsamCount",
  "corsumoCount",
  "krogtaarCount",
  "armzeus1Count",
  "heavyimpactCount",
  "tlllongshotCount",
  "corkargCount",
  "clbCount",
  "taipanCount",
  "cormonstaCount",
  "airwolf3gCount",
  "armcycloneCount",
  "tremCount",
  "corsumo1Count",
  "cordemCount",
  "armbullCount",
  "corthudCount",
  "armcrabeCount",
  "tllgrimCount",
  "armtigre2Count",
  "shivaCount",
  "aexxecCount",
  "armsnipeCount",
  "corhrkCount",
  "corkarg1Count",
  "armfboyCount",
  "corcrashCount",
  "gorgCount",
  "tllloggerheadCount",
  "tllloggerheadKills",
  "corthud1Count",
  "cormistCount",
  "cortotalCount",
  "armsonicCount",
  "tankanotorCount",
  "corspecCount",
  "armhdpwCount",
  "armmartCount",
  "armstumpCount",
  "corawacCount",
  "tllblindCount",
  "rroostCount",
  "armshock1Kills",
  "cormist1Kills",
  "cormortKills",
  "armravenKills",
  "armsam1Kills",
  "armthundKills",
  "corcrwKills",
  "armfleaKills",
  "marauderKills",
  "corkrogKills",
  "corhurcKills",
  "armflash1Kills",
  "armmerlKills",
  "corgalaKills",
  "hyperionKills",
  "armorionKills",
  "armfastKills",
  "armcybrKills",
  "tllcrawlbKills",
  "armzeusKills",
  "abroadsideKills",
  "corragKills",
  "corprotKills",
  "corgolKills",
  "armraven1Kills",
  "anvilKills",
  "tllvaliantKills",
  "shivaKills",
  "armflashKills",
  "armblzKills",
  "arm_furieKills",
  "armjanus1Kills",
  "armpraetKills",
  "corpyroKills",
  "armsamKills",
  "corsumoKills",
  "krogtaarKills",
  "armzeus1Kills",
  "heavyimpactKills",
  "tlllongshotKills",
  "corkargKills",
  "clbKills",
  "taipanKills",
  "cormonstaKills",
  "airwolf3gKills",
  "armcycloneKills",
  "tremKills",
  "corsumo1Kills",
  "cordemKills",
  "armbullKills",
  "corthudKills",
  "armcrabeKills",
  "tllgrimKills",
  "armtigre2Kills",
  "aexxecKills",
  "armsnipeKills",
  "corhrkKills",
  "corkarg1Kills",
  "armfboyKills",
  "corcrashKills",
  "gorgKills",
  "corthud1Kills",
  "cormistKills",
  "cortotalKills",
  "armsonicKills",
  "tankanotorKills",
  "corspecKills",
  "armhdpwKills",
  "armmartKills",
  "armstumpKills",
  "corawacKills",
  "tllblindKills",
  "rroostKills",
  "armtarantulaKills",
  "corpreCount",
  "corpreKills",
  "armamd1Count",
  "armamd1Kills",
  "cordoomCount",
  "cordoomKills",
  "cormddmKills",
  "tlldemonKills",
  "tllhailstormKills",
  "tllcopterKills",
  "tllaetherKills",
  "armtemKills",
  "coradonKills",
  "cormddmCount",
  "tlldemonCount",
  "tllhailstormCount",
  "tllcopterCount",
  "tllaetherCount",
  "armtemCount",
  "coradonCount",
  "tllamphibotKills",
  "coramphKills",
  "tllamphibotCount",
  "coramphCount",
  "akmechCount",
  "krogtaarCount",
  "cortotalCount",
  "akmechKills",
  "krogtaarKills",
  "cortotalKills",

  }

chickenColors = {
  {"armshock1",    "\255\255\100\100"},
  {"cormist1",     "\255\255\100\100"},
  {"cormort",     "\255\255\150\150"},
  {"armraven",     "\255\184\075\200"},
  {"armsam1",     "\255\255\100\100"},
  {"armthund",      "\255\184\100\255"},
  {"corcrw",     "\255\184\075\200"},
  {"armflea",      "\255\184\100\255"},
  {"marauder",     "\255\184\075\200"},
  {"corkrog",     "\255\184\075\200"},
  {"corhurc",     "\255\255\150\150"},
  {"armflash1",     "\255\255\100\100"},
  {"armmerl",     "\255\255\150\150"},
  {"corgala",     "\255\184\075\200"},
  {"hyperion",     "\255\184\075\200"},
  {"armtarantula",     "\255\255\150\150"},
  {"armorion",     "\255\184\075\200"},
  {"armfast",     "\255\255\150\150"},
  {"armcybr",     "\255\184\075\200"},
  {"tllcrawlb",     "\255\255\150\150"},
  {"armzeus",     "\255\255\150\150"},
  {"abroadside",     "\255\184\075\200"},
  {"corrag",     "\255\255\150\150"},
  {"corprot",     "\255\184\075\200"},
  {"corgol",     "\255\255\150\150"},
  {"armraven1",     "\255\255\100\100"},
  {"anvil",     "\255\184\075\200"},
  {"tllvaliant",     "\255\184\075\200"},
  {"armflash",      "\255\184\100\255"},
  {"armblz",     "\255\255\100\100"},
  {"arm_furie",     "\255\184\075\200"},
  {"armjanus1",     "\255\255\100\100"},
  {"armpraet",     "\255\184\075\200"},
  {"corpyro",     "\255\255\150\150"},
  {"armsam",      "\255\184\100\255"},
  {"corsumo",     "\255\255\150\150"},
  {"krogtaar",     "\255\184\075\200"},
  {"armzeus1",     "\255\255\150\150"},
  {"heavyimpact",     "\255\184\075\200"},
  {"tlllongshot",     "\255\184\075\200"},
  {"corkarg",     "\255\184\075\200"},
  {"clb",     "\255\255\150\150"},
  {"taipan",     "\255\255\150\150"},
  {"cormonsta",     "\255\255\150\150"},
  {"airwolf3g",     "\255\184\075\200"},
  {"armcyclone",     "\255\184\075\200"},
  {"trem",     "\255\184\075\200"},
  {"corsumo1",     "\255\255\150\150"},
  {"cordem",     "\255\184\075\200"},
  {"armbull",     "\255\255\150\150"},
  {"corthud",      "\255\184\100\255"},
  {"armcrabe",     "\255\184\075\200"},
  {"tllgrim",     "\255\184\075\200"},
  {"armtigre2",     "\255\184\075\200"},
  {"aexxec",     "\255\255\100\100"},
  {"armsnipe",     "\255\255\100\100"},
  {"corhrk",     "\255\255\100\100"},
  {"shiva",     "\255\255\100\100"},
  {"corkarg1",     "\255\184\075\200"},
  {"armfboy",     "\255\255\150\150"},
  {"corcrash",     "\255\255\100\100"},
  {"gorg",     "\255\184\075\200"},
  {"tllmatamata",     "\255\255\100\100"},
  {"corthud1",     "\255\255\100\100"},
  {"cormist",     "\255\255\100\100"},
  {"cortotal",     "\255\255\100\100"},
  {"armsonic",     "\255\255\100\100"},
  {"tankanotor",     "\255\255\100\100"},
  {"corspec",     "\255\255\100\100"},
  {"armhdpw",     "\255\255\150\150"},
  {"armmart",     "\255\255\150\150"},
  {"armstump",      "\255\184\100\255"},
  {"corawac",     "\255\255\100\100"},
  {"tllblind",     "\255\184\075\200"},
  {"tllloggerhead",     "\255\184\075\200"},
  {"rroost",     "\255\100\100\255"},
  {"corpre",     "\255\184\075\200"},
  {"armamd1",     "\255\184\075\200"},
  {"cordoom",     "\255\184\075\200"},
  {"cormddm",     "\255\184\075\200"},
  {"tlldemon",    "\255\184\075\200"},
  {"tllhailstorm",    "\255\184\075\200"},
  {"tllcopter",   "\255\184\075\200"},
  {"tllaether",   "\255\184\075\200"},
  {"armtem",      "\255\184\075\200"},
  {"coradon",     "\255\184\075\200"},
  {"tllamphibot", "\255\184\075\200"},
  {"coramph",     "\255\184\075\200"},
  {"akmech",     "\255\184\075\200"},
  {"krogtaar",     "\255\184\075\200"},
  {"cortotal",     "\255\184\075\200"},

}
end

local chickenColorSet = {}
for _, t in ipairs(chickenColors) do
  chickenColorSet[t[1]] = t[2]
end

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


fontHandler.UseFont(panelFont)
local panelFontSize  = fontHandler.GetFontSize()
fontHandler.UseFont(waveFont)
local waveFontSize   = fontHandler.GetFontSize()

function comma_value(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

local function MakeCountString(type, showbreakdown)
  local t = {}
  local total = 0
  if (cenabled == 1) then total = 0 else total = -999 end --ugly fix me (chickenend)
  local showbrackets = false
  for i, colorInfo in ipairs(chickenColors) do
    if gameInfo[colorInfo[1]..type] == nil then
      Spring.Echo("Check def for unit: ",colorInfo[1])
    end
    local subTotal = gameInfo[colorInfo[1]..type]
    if subTotal > 0 then
      table.insert(t, colorInfo[2]..subTotal)
      total = total + subTotal
      showbrackets = true
    end
  end

  if (cenabled == 1) then
    total = total + gameInfo["chickend"..type]
  else
    total = total + gameInfo["armrl"..type]
    total = total + gameInfo["armflak"..type]
    total = total + gameInfo["arm_big_bertha"..type]
    total = total + gameInfo["corpre"..type]
    total = total + gameInfo["armamd1"..type]
    total = total + gameInfo["cordoom"..type]

  end


  if showbreakdown then
    local breakDown =  table.concat(t, white..",")..white
    if showbrackets then
      return string.format(aifaction..": %d (%s)", total, breakDown)
    else
      return string.format(aifaction..": %d", total)
    end
  else
    return (aifaction.." Kills: " .. white .. total)
  end
end

local function updatePos(x, y)
  x1 = math.min(viewSizeX-w/2,x)
  y1 = math.min(viewSizeY-h/2,y)
  updatePanel = true
end


local function PanelRow(n)
  return panelMarginX, h-panelMarginY-(n-1)*(panelFontSize+panelSpacingY)
end


local function WaveRow(n)
  return n*(waveFontSize+waveSpacingY)
end


local function CreatePanelDisplayList()
  gl.PushMatrix()
  gl.Translate(x1, y1, 0)
  gl.CallList(displayList)
  fontHandler.DisableCache()
  fontHandler.UseFont(panelFont)
  fontHandler.BindTexture()
  local currentTime = GetGameSeconds()
  local techLevel = ""
  if (currentTime > gameInfo.gracePeriod) then
    local secondsLeftWave = math.max(0, math.ceil(GetGameRulesParam('chickenSpawnRate') - (waveTimer and DiffTimers(GetTimer(), waveTimer) or 0)))

    if gameInfo.queenAnger < 100 then
      techLevel = side.." Anger: " .. gameInfo.queenAnger .. "% (next wave: "..secondsLeftWave..")"
    else
      techLevel = side.." Health: " .. gameInfo.queenLife .. "%"
    end
  else
    techLevel = "Grace Period: " .. math.ceil(((currentTime - gameInfo.gracePeriod) * -1) -0.5)
  end

  fontHandler.DrawStatic(white..techLevel, PanelRow(1))
  fontHandler.DrawStatic(white..gameInfo.unitCounts, PanelRow(2))
  fontHandler.DrawStatic(white..gameInfo.unitKills, PanelRow(3))
if (cenabled == 1) then
  fontHandler.DrawStatic(white.."Burrows: "..gameInfo.roostCount, PanelRow(4))
  fontHandler.DrawStatic(white.."Burrow Kills: "..gameInfo.roostKills, PanelRow(5))
else
  fontHandler.DrawStatic(white.."Burrows: "..gameInfo.rroostCount, PanelRow(4))
  fontHandler.DrawStatic(white.."Burrow Kills: "..gameInfo.rroostKills, PanelRow(5))
end
  local s = white.."Mode: "..difficulties[gameInfo.difficulty]
  if gotScore then
    fontHandler.DrawStatic(white.."Your Score: "..comma_value(scoreCount), 88, h-170)
  else
    fontHandler.DrawStatic(white.."Mode: "..difficulties[gameInfo.difficulty], 120, h-170)
  end
  gl.Texture(false)
  gl.PopMatrix()
end


local function Draw()
  if (not enabled)or(not gameInfo) then
    return
  end

  if (updatePanel) then
    if (guiPanel) then gl.DeleteList(guiPanel); guiPanel=nil end
    guiPanel = gl.CreateList(CreatePanelDisplayList)
    updatePanel = false
  end

  if (guiPanel) then
    gl.CallList(guiPanel)
  end

  if (waveMessage)  then
    local t = Spring.GetTimer()
    fontHandler.UseFont(waveFont)
    local waveY = viewSizeY - Spring.DiffTimers(t, waveTime)*waveSpeed*viewSizeY
    if (waveY > 0) then
      for i, message in ipairs(waveMessage) do
        fontHandler.DrawCentered(message, viewSizeX/2, waveY-WaveRow(i))
      end
    else
      waveMessage = nil
      waveY = viewSizeY
    end
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function UpdateRules()
  if (not gameInfo) then
    gameInfo = {}
  end

  for _, rule in ipairs(rules) do
    gameInfo[rule] = Spring.GetGameRulesParam(rule) or 999
    --Spring.Echo(rule .. "   "..gameInfo[rule])
  end

  gameInfo.unitCounts = MakeCountString("Count", true)
  gameInfo.unitKills  = MakeCountString("Kills", false)

  updatePanel = true
end


function ChickenEvent(chickenEventArgs)
  if (chickenEventArgs.type == "wave") then
    waveTimer = GetTimer()
    if (cenabled == 1) then
      if (gameInfo.roostCount < 1) then
        return
      end
    else
      if (gameInfo.rroostCount < 1) then
        return
      end
    end
    waveMessage    = {}
    waveCount      = waveCount + 1
    waveMessage[1] = "Wave "..waveCount
    waveMessage[2] = waveColors[chickenEventArgs.tech]..chickenEventArgs.number.." "..aifaction

    waveTime = Spring.GetTimer()

  elseif (chickenEventArgs.type == "burrowSpawn") then
    UpdateRules()
  elseif (chickenEventArgs.type == "queen") then
    waveMessage    = {}
    waveMessage[1] = "The "..side.." is angered!"
    waveTime = Spring.GetTimer()
  elseif (chickenEventArgs.type == "score"..(Spring.GetMyTeamID())) then
    gotScore = chickenEventArgs.number
  end
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------

function widget:Initialize()
  displayList = gl.CreateList( function()
    gl.Color(1, 1, 1, 1)
    gl.Texture(panelTexture)
    gl.TexRect(0, 0, w, h)
  end)

  widgetHandler:RegisterGlobal("ChickenEvent", ChickenEvent)

  UpdateRules()
   viewSizeX, viewSizeY = gl.GetViewSizes()
  local x = math.abs(math.floor(viewSizeX - 320))
  local y = math.abs(math.floor(viewSizeY - 300))
  updatePos(x, y)
end


function widget:Shutdown()
  if hasChickenEvent then
    Spring.SendCommands({"luarules HasChickenEvent 0"})
  end
  fontHandler.FreeFont(panelFont)
  fontHandler.FreeFont(waveFont)

  if (guiPanel) then gl.DeleteList(guiPanel); guiPanel=nil end

  gl.DeleteList(displayList)
  gl.DeleteTexture(panelTexture)
  widgetHandler:DeregisterGlobal("ChickenEvent")
end

function widget:GameFrame(n)
  if not(hasChickenEvent) and n > 0 then
    Spring.SendCommands({"luarules HasChickenEvent 1"})
    hasChickenEvent = true
  end
  if (n%30< 1) then
    UpdateRules()

    if (not enabled and n > 0) then
      enabled = true
    end
--
--    queenAnger = math.ceil((((GetGameSeconds()-gameInfo.gracePeriod+gameInfo.queenAnger)/(gameInfo.queenTime-gameInfo.gracePeriod))*100) -0.5)

  end
  if gotScore then
    local sDif = gotScore - scoreCount
    if sDif > 0 then
      scoreCount = scoreCount + math.ceil(sDif / 7.654321)
      if scoreCount > gotScore then
        scoreCount = gotScore
      else
        updatePanel = true
      end
    end
  end
end


function widget:DrawScreen()

  Draw()
end


function widget:MouseMove(x, y, dx, dy, button)
  if (enabled and moving) then
    updatePos(x1 + dx, y1 + dy)
  end
end


function widget:MousePress(x, y, button)
  if (enabled and
       x > x1 and x < x1 + w and
       y > y1 and y < y1 + h) then
    capture = true
    moving  = true
  end
  return capture
end


function widget:MouseRelease(x, y, button)
  if (not enabled) then
    return
  end
  capture = nil
  moving  = nil
  return capture
end


function widget:ViewResize(vsx, vsy)
  x1 = math.floor(x1 - viewSizeX)
  y1 = math.floor(y1 - viewSizeY)
  viewSizeX, viewSizeY = vsx, vsy
  x1 = viewSizeX + x1
  y1 = viewSizeY + y1
end


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
