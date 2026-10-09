--!nonstrict
--   left click   start / pause
--   right click  reset
--   IPC          toggle | reset

local running = false
local startedAt = 0
local accumulated = 0

local function elapsed()
  if running then
    return accumulated + (os.time() - startedAt)
  end
  return accumulated
end

local function fmt(s)
  s = math.floor(tonumber(s) or 0)
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
  local glyph = "stopwatch"
  if not running and e > 0 then
    glyph = "player-pause"
  end

  if barWidget.isVertical() then
    barWidget.render(ui.column({ align = "center" }, {
      ui.glyph({ name = glyph }),
    }))
    return
  end

  -- Label hidden only when idle at zero
  if not running and e == 0 then
    barWidget.render(ui.row({ align = "center" }, {
      ui.glyph({ name = glyph }),
    }))
    return
  end

  barWidget.render(ui.row({ gap = 6, align = "center" }, {
    ui.glyph({ name = glyph }),
    ui.label({ text = fmt(e)  }),
  }))
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

-- Redraw each second while running, driven by the service
noctalia.state.watch("sw.tick", function(value)
  if running then
    render()
  end
end)

-- update is needed for the initial load
function update()
  render()
end

function onClick()
  toggle()
end

function onRightClick()
  reset()
end

function onIpc(event, payload)
  if event == "toggle" then
    toggle()
  elseif event == "reset" then
    reset()
  end
end
