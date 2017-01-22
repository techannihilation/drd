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

local Spring              = Spring
local GetGameSeconds      = Spring.GetGameSeconds
local GetGameRulesParam   = Spring.GetGameRulesParam
local GetGameRulesParams  = Spring.GetGameRulesParams
local gl                  = gl
local widgetHandler       = widgetHandler
local math                = math
local table               = table
local UnitDefNames        = UnitDefNames

local displayList       -- investigate me todo
local dropdownCreepList
local fontHandler       = loadstring(VFS.LoadFile(LUAUI_DIRNAME.."modfonts.lua", VFS.ZIP_FIRST))()
local panelFont         = LUAUI_DIRNAME.."Fonts/FreeSansBold_14"
local waveFont          = LUAUI_DIRNAME.."Fonts/Skrawl_40"
local panelTexture
local guiPanel          -- a displayList
local spawnPanel        -- a displayList
local updatePanel
local updateSpawnPanel

local viewSizeX, viewSizeY = 0,0
local w               = 300
local h               = 210
local x1              = - w - 50
local y1              = - h - 50
local panelMarginX    = 30
local panelMarginY    = 40
local panelSpacingY   = 7
local squadPaddingY   = 12
local squadPaddingX   = 10
local squadSpacingY   = 1
local waveSpacingY    = 7
local moving
local capture
local gameInfo
local waveSpeed       = 0.2
local waveCount       = 0
local currentTimeSeconds
local waveTimeTimer
local waveTimeSeconds
local enabled
local gotScore
local scoreCount	  = 0

local hasChickenEvent = false


local side
local aifaction
local chickenEnabled = Spring.GetModOptions().mo_norobot == '1'


if chickenEnabled then
  side = "Queen"
  aifaction = "Chicken"
  panelTexture    = ":n:"..LUAUI_DIRNAME.."Images/panel.tga"
else
  side = "King"
  aifaction = "Robot"
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

fontHandler.UseFont(panelFont)
local panelFontSize  = fontHandler.GetFontSize()
fontHandler.UseFont(waveFont)
local waveFontSize   = fontHandler.GetFontSize()


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------


local function CommaValue(amount)
  local formatted = amount
  while true do
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

local function LinearRGBScale(RGBInt, oldMin, oldMax)
--  local oldMin = 0
--  local oldMax = 255

  local oldRange = (oldMax - oldMin)
  local newMin = 40
  local newMax = 90
  local newValue
  if (oldRange == 0) then
    newValue = (newMin + newMax) / 2
  else
    local newRange = (newMax - newMin)
    newValue = (((RGBInt - oldMin) * newRange) / oldRange) + newMin
  end
  return newValue
end

local function ColoredUnits(countTable)
  local maxPower = -math.huge
  local minPower = math.huge

  for k,v in pairs( countTable ) do
    if type(v[2]) == 'number' then
      maxPower = math.max( maxPower, v[2] )
      minPower = math.min( minPower, v[2] )
    end
  end

  local powerFactor = 0.0003
  local maxPowerLog = math.log(maxPower*powerFactor+1)

  for i, unit in ipairs(countTable) do
    local power = math.log(unit[2]*powerFactor+1)
    power = LinearRGBScale(power, 0, maxPowerLog)
    --    local green = maxRed - red

    local red = 255*power/ 100
    local green = 255 * (100 - power)/ 100
      local blue = 60
      unit[1] = string.char(255) .. string.char(red) .. string.char(green) .. string.char(blue) .. unit[1]..white
  end
  return countTable
end

local function GetUnitsInfo(count_or_kills, sortByPower, char_length)
  local total = 0
  local squads = {}
  for ruleName, value in pairs(gameInfo) do

    if string.match(ruleName, count_or_kills) then
      local unitName = ruleName:gsub(count_or_kills, "")
      local squadDef = UnitDefNames[unitName]

      local squadTotal = value and tonumber(value) or 0

      if chickenEnabled then
        total = total + squadTotal
      -- skip empty squaddefs and burrows, subtotal, squaddef and squaddef.name should not be nil
      elseif squadTotal and squadDef and squadTotal > 0 and squadDef.name ~= "rroost" and squadDef.name ~= "roost" then
        local squadPower = squadDef.power * squadTotal
        local squadName = squadDef.humanName
        table.insert(squads, { squadTotal..' '..squadName, squadPower })
        total = total + squadTotal
      end
    end
  end

  -- sort squads by cumulative power
  if sortByPower then
    table.sort(squads, function( a,b )
      if (a[2] < b[2]) then
        return false
      elseif (a[2] > b[2]) then
        return true
      else
        return false
      end
    end)
  end


  -- color squads by squad power
  squads = ColoredUnits(squads)


  -- strip power sums strings,power-table
  local tempTable = {}
  for k, v in pairs(squads) do
    tempTable[k] = v[1]
  end
  squads = nil

  return tempTable, total
end

local function ShortenColorString(str, length)
  if #str:gsub('%W','')+2 > length then
    local substring = str:sub(0, length-2)

    local brokenCommaColor = substring:find('\44\255', -10)
    local brokenWhite = substring:find('\255', -3)
    if brokenCommaColor then
      substring = str:sub(0, brokenCommaColor-1)
    elseif brokenWhite then
      for i = #substring- brokenWhite, 0, -1 do
        substring = substring..string.char(255)
      end
    else
      -- cut off , character
      substring = substring:gsub(',$','')
    end

    str = substring..white..'...'
  end
  return str
end

local function InfoTextRow(type, showbreakdown)

  local t, total = GetUnitsInfo(type, true)

  local text
  if type == 'Count' then
    text = aifaction..'s: '
  else
    text = aifaction..'\'s Kills: '
  end

  text = text..total

  if showbreakdown then
    -- join squad strings
    local csvColorSquads =  table.concat(t, ",")
    local squadsShort = ShortenColorString(csvColorSquads, 26)

    local squadsString = total > 0 and '('..squadsShort..')' or ''
    text = text..' '..squadsString
  end

  return text
end

local function UpdatePos(x, y)
  x1 = math.min(viewSizeX-w/2,x)
  y1 = math.min(viewSizeY-h/2,y)
  updatePanel = true
end

local function PanelRow(n, indent)
  return panelMarginX + (indent and indent or 0), h-panelMarginY-(n-1)*(panelFontSize+panelSpacingY)
end

local function SquadRow(n)
  return panelMarginX, h-panelMarginY-(n-1)*(panelFontSize+squadSpacingY)
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
  local stageProgressText = ""
  if (currentTimeSeconds > gameInfo.gracePeriod and waveCount > 0) then
    if gameInfo.queenAnger < 100 then
      local secondsLeftWave = math.max(0, math.ceil(GetGameRulesParam('chickenSpawnRate') - (waveTimeSeconds and currentTimeSeconds - waveTimeSeconds or 0)))
      stageProgressText = side.." Anger: " .. gameInfo.queenAnger .. "% (wave "..(waveCount+1).." in "..secondsLeftWave.."s)"
    else
      stageProgressText = side.." Health: " .. gameInfo.queenLife .. "%"
    end
  else
    stageProgressText = "Grace Period: " .. math.max(0, math.floor(gameInfo.gracePeriod - currentTimeSeconds))
  end

  fontHandler.DrawStatic(white.. stageProgressText, PanelRow(1))
  fontHandler.DrawStatic(white..gameInfo.unitCounts, PanelRow(2))
  fontHandler.DrawStatic(white..gameInfo.unitKills, PanelRow(3))

  if chickenEnabled then
    fontHandler.DrawStatic(white.."Burrows: "..gameInfo.roostCount, PanelRow(4))
    fontHandler.DrawStatic(white.."Burrow Kills: "..gameInfo.roostKills, PanelRow(5))
  else
    fontHandler.DrawStatic(white.."Burrows: "..gameInfo.rroostCount, PanelRow(4))
    fontHandler.DrawStatic(white.."Burrow Kills: "..gameInfo.rroostKills, PanelRow(5))
  end

  if mo_level then
    fontHandler.DrawStatic(white.."Level: "..mo_level, PanelRow(6, 65))
  end

  if gotScore then
    fontHandler.DrawStatic(white.."Your Score: "..CommaValue(scoreCount), 88, h-170)
  else
    fontHandler.DrawStatic(white.."Mode: "..difficulties[gameInfo.difficulty], 120, h-170)
  end

  gl.Texture(false)
  gl.PopMatrix()
end

local function DrawBlackAlphaBox(minX, minY, minZ, maxX, maxY, maxZ)
   gl.BeginEnd(GL.QUADS, function()
      gl.Color(0,0,0,0.45)
      --// top
      gl.Vertex(minX, maxY, minZ);
      gl.Vertex(maxX, maxY, minZ);
      gl.Vertex(maxX, maxY, maxZ);
      gl.Vertex(minX, maxY, maxZ);
      --// bottom
      gl.Vertex(minX, minY, minZ);
      gl.Vertex(minX, minY, maxZ);
      gl.Vertex(maxX, minY, maxZ);
      gl.Vertex(maxX, minY, minZ);
   end);
   gl.BeginEnd(GL.QUAD_STRIP, function()
      --// sides
      gl.Vertex(minX, minY, minZ);
      gl.Vertex(minX, maxY, minZ);
      gl.Vertex(minX, minY, maxZ);
      gl.Vertex(minX, maxY, maxZ);
      gl.Vertex(maxX, minY, maxZ);
      gl.Vertex(maxX, maxY, maxZ);
      gl.Vertex(maxX, minY, minZ);
      gl.Vertex(maxX, maxY, minZ);
      gl.Vertex(minX, minY, minZ);
      gl.Vertex(minX, maxY, minZ);
   end);
end

local function Draw()

  if not enabled or not gameInfo then
    return
  end

  currentTimeSeconds = GetGameSeconds()

  if (updatePanel) then
    if (guiPanel) then gl.DeleteList(guiPanel); guiPanel=nil end
    guiPanel = gl.CreateList(CreatePanelDisplayList)
    updatePanel = false
  end

  if (guiPanel) then
    gl.CallList(guiPanel)
  end

  if (updateSpawnPanel) then
    if (spawnPanel) then gl.DeleteList(spawnPanel); spawnPanel=nil end
    spawnPanel = gl.CreateList(CreatePanelDisplayList)
    updateSpawnPanel = false
  end

  if (spawnPanel) then
    gl.CallList(spawnPanel)
  end

  if (waveMessage)  then
    local t = Spring.GetTimer()
    fontHandler.UseFont(waveFont)
    local waveY = viewSizeY - Spring.DiffTimers(t, waveTimeTimer)*waveSpeed*viewSizeY
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
  local rulesParams = GetGameRulesParams()
  for ruleKey, ruleValue in pairs(rulesParams) do
    -- PD ?
    if type(ruleValue) == 'table' then
      for name, value in pairs(ruleValue) do
        if value ~= nil then
          gameInfo[name] = value
        end
      end
      -- RD ?
    elseif type(ruleKey) == 'string' and type(ruleValue) == 'number' then
      if ruleValue ~= nil then
        if string.find(ruleKey, '(Count|Kills)') then
--          Spring.Echo(ruleKey..ruleValue)
        end
        gameInfo[ruleKey] = ruleValue
      end
    end
  end

  gameInfo.unitCounts = InfoTextRow("Count", not chickenEnabled)
  gameInfo.unitKills  = InfoTextRow("Kills", false)

  updatePanel = true
end


function ChickenEvent(chickenEventArgs)
  if (chickenEventArgs.type == "wave") then
    waveTimeSeconds = currentTimeSeconds
    waveTimeTimer = Spring.GetTimer()
    UpdateRules()
    if ((gameInfo.roostCount or 0) + (gameInfo.rroostCount or 0)) < 1 then
      return
    end
    waveMessage    = {}
    waveCount      = waveCount + 1
    waveMessage[1] = "Wave "..waveCount
    waveMessage[2] = waveColors[chickenEventArgs.tech]..chickenEventArgs.number.." "..aifaction

  elseif (chickenEventArgs.type == "burrowSpawn") then
    UpdateRules()
  elseif (chickenEventArgs.type == "queen") then
    waveMessage    = {}
    waveMessage[1] = "The "..side.." is angered!"
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

  dropdownCreepList = gl.CreateList( function()
    gl.Color(0.5, 1, 1, 0)
    gl.Texture(panelTexture)
    gl.TexRect(0, 0, 100, 100)
  end)

  widgetHandler:RegisterGlobal("ChickenEvent", ChickenEvent)

  UpdateRules()
  viewSizeX, viewSizeY = gl.GetViewSizes()
  local x = math.abs(math.floor(viewSizeX - 320))
  local y = math.abs(math.floor(viewSizeY - 300))
  UpdatePos(x, y)
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
    UpdatePos(x1 + dx, y1 + dy)
end


function widget:IsAbove(x, y)
  local hoverXMin = x1 + 110
  local hoverYMin = y1 + 160
  local yMargin = 7
  -- within unitdefs text row in chicken box and grace passed and more than 0 squads spawned
  if hoverXMin < x and y1 + 145 < y and x < x1 + 240 and y < hoverYMin and currentTime > gameInfo.gracePeriod and #GetSquadCountTable('Count', true) > 0 then
    local squadCountTable = GetSquadCountTable('Count', true)
    DeleteSpawnPanel()
    spawnPanel = gl.CreateList(function()
      local dropdownIndent = 130
      local squadDropdownHeight = (#squadCountTable)*(panelFontSize+panelSpacingY)+yMargin
      DrawBlackAlphaBox(hoverXMin+35,hoverYMin,0,hoverXMin+160,hoverYMin-squadDropdownHeight,0)
      gl.PushMatrix()
      gl.Translate(x1, y1, 0)

      fontHandler.DisableCache()
      fontHandler.UseFont(panelFont)
      fontHandler.BindTexture()
      for i, v in ipairs(squadCountTable) do
        v = ShortenColorString(v, 19)
        -- draw row with indentation and top margin
        local displayListX, displayListY = PanelRow(1 + i, dropdownIndent)
        fontHandler.DrawStatic(v, displayListX, displayListY-yMargin)
      end

      gl.PopMatrix()
    end)
  else
    DeleteSpawnPanel()
  end

end

function DeleteSpawnPanel()
  if spawnPanel then
    gl.DeleteList(spawnPanel)
    spawnPanel = nil
  end
end

function widget:IsAbove(x, y)
  local hoverXMin = x1 + 110
  local hoverYMin = y1 + 160
  -- within unitdefs text row in chicken box and grace passed and more than 0 squads spawned
  if hoverXMin < x and y1 + 145 < y and x < x1 + 270 and y < hoverYMin and currentTimeSeconds > gameInfo.gracePeriod then
    local squadCountTable = GetUnitsInfo('Count', true)
    if #squadCountTable > 0 then
      DeleteSpawnPanel()
      spawnPanel = gl.CreateList(function()
        local squadDropdownHeight = (#squadCountTable)*(panelFontSize+squadSpacingY) + squadPaddingY
        DrawBlackAlphaBox(hoverXMin+5,hoverYMin,0,hoverXMin+165,hoverYMin-squadDropdownHeight,0)
        gl.PushMatrix()
        gl.Translate(x1, y1, 0)

        fontHandler.DisableCache()
        fontHandler.UseFont(panelFont)
        fontHandler.BindTexture()
        for i, v in ipairs(squadCountTable) do
          v = ShortenColorString(v, 21)
          -- draw row with indentation and top padding
          local displayListX, displayListY = SquadRow(1 + i)
          fontHandler.DrawStatic(v, displayListX+93, displayListY-squadPaddingY)
        end

        gl.PopMatrix()
      end)
    else
      DeleteSpawnPanel()
    end
  else
    DeleteSpawnPanel()
  end
end

function DeleteSpawnPanel()
  if spawnPanel then
    gl.DeleteList(spawnPanel)
    spawnPanel = nil
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
-- for debug
function table.has_value(tab, val)
    for _, value in ipairs (tab) do
        if value == val then
            return true
        end
    end
    return false
end

function table.full_of(tab, val)
    for _, value in ipairs (tab) do
        if value ~= val then
            return false
        end
    end
    return true
end

-- for printing tables
function table.val_to_str(v)
  if "string" == type(v) then
    v = string.gsub(v, "\n", "\\n" )
    if string.match(string.gsub(v,"[^'\"]",""), '^"+$' ) then
      return "'" .. v .. "'"
    end
    return '"' .. string.gsub(v,'"', '\\"' ) .. '"'
  else
    return "table" == type(v) and table.tostring(v) or
      tostring(v)
  end
end

function table.key_to_str(k)
  if "string" == type(k) and string.match(k, "^[_%a][_%a%d]*$" ) then
    return k
  else
    return "[" .. table.val_to_str(k) .. "]"
  end
end

function table.tostring(tbl)
  local result, done = {}, {}
  for k, v in ipairs(tbl ) do
    table.insert(result, table.val_to_str(v) )
    done[ k ] = true
  end
  for k, v in pairs(tbl) do
    if not done[ k ] then
      table.insert(result,
        table.key_to_str(k) .. "=" .. table.val_to_str(v) )
    end
  end
  return "{" .. table.concat(result, "," ) .. "}"
end
