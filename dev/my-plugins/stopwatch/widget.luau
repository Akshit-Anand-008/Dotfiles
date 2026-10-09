local running = false
local startedAt = 0      -- wall-clock time when the current run began
local accumulated = 0    -- seconds banked from earlier runs

-- Derive elapsed time from the clock instead of counting ticks, so it never drifts
local function elapsed()
  if running then
    return accumulated + (os.time() - startedAt)
  end
  return accumulated
end

local function fmt(s)
  local h = s // 3600
  local m = (s % 3600) // 60
  local sec = s % 60
  if h > 0 then
    return string.format("%d:%02d:%02d", h, m, sec)
  end
  return string.format("%02d:%02d", m, sec)
end

local function render()
  local e = elapsed()

  if running then
    barWidget.setGlyph("stopwatch")
  elseif e > 0 then
    barWidget.setGlyph("player-pause")
  else
    barWidget.setGlyph("stopwatch")
  end

  -- Show the time while running or paused, hide it only at zero
  if running or e > 0 then
    barWidget.setText(fmt(e))
  else
    barWidget.setText("")
  end

  barWidget.setTooltip(fmt(e) .. "  |  Left click: start/pause  |  Right click: reset")
end

local function toggle()
  if running then
    accumulated = elapsed()
    running = false
  else
    startedAt = os.time()
    running = true
  end
  render()
end

local function reset()
  running = false
  accumulated = 0
  render()
end

function update()
  noctalia.setUpdateInterval(1000)
  render()
end

function onClick()
  toggle()
end

function onRightClick()
  reset()
end

-- Lets you control it from a keybind or a terminal
function onIpc(event, payload)
  if event == "toggle" then
    toggle()
  elseif event == "reset" then
    reset()
  end
end

render()
