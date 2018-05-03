if love.filesystem then
	require 'rocks' ()
end

function love.conf(t)
	t.identity = "love-rl"
	t.version = "11.1"
	t.console = false
 
    t.window.title = "LoveRL"
    t.window.icon = nil
    t.window.width = 800
    t.window.height = 600
    t.window.borderless = false
    t.window.resizable = false
    t.window.minwidth = 1
    t.window.minheight = 1
    t.window.fullscreen = false
    t.window.fullscreentype = "desktop"
    t.window.vsync = false
    t.window.msaa = 0
    t.window.display = 1
    t.window.highdpi = false
    t.window.x = nil
    t.window.y = nil
 
	t.dependencies = {
        "middleclass ~> 4.1.1",
		"lovetoys ~> 0.3.1",
        "loveconsole ~> 0.1.2"
	}
end
