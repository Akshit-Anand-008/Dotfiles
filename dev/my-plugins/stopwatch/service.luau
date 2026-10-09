--!nonstrict
-- Headless service: publishes the time once a second so the bar widget
-- never needs an update interval of its own.

noctalia.setUpdateInterval(1000)

function update()
  noctalia.state.set("sw.tick", os.time())
end
