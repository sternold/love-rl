console = require 'loveconsole.console'
console:initialize({
	name = "main",
	extend = true,
	buffer_width = 80,
	buffer_height = 50,
	font = "res/fonts/press-start-2p.ttf",
	font_size = 16,
})
colors = require 'loveconsole.colors'
class = require 'middleclass'
lovetoys = require 'lovetoys.lovetoys'
lovetoys.initialize({
	debug = true,
	globals = true
})

local keys = require 'src.managers.keys'
local game = require 'src.game'

function love.run()
    if love.math then
		love.math.setRandomSeed(os.time())
    end
	if love.load then love.load(arg) end
	-- We don't want the first frame's dt to include time taken by love.load.
	if love.timer then love.timer.step() end
	local dt = 0
    if love.graphics and love.graphics.isActive() then
		love.graphics.clear(love.graphics.getBackgroundColor())
		love.graphics.origin()
		if love.draw then love.draw() end
		love.graphics.present()
	end
	-- Main loop time.
	while true do
		-- Process events.
		if love.event then
			love.event.pump()
			for name, a,b,c,d,e,f in love.event.poll() do
			if name == "quit" then
				if not love.quit or not love.quit() then
					return a
				end
			end
			love.handlers[name](a,b,c,d,e,f)		
            end
		end
		-- Update dt, as we'll be passing it to update
		if love.timer then
			love.timer.step()
			dt = love.timer.getDelta()
		end
		-- Call update and draw
		if love.update then love.update(dt) end -- will pass 0 if love.timer is disabled
		if love.timer then love.timer.sleep(0.001) end
	end
end

function love.load()
	love.keyboard.setKeyRepeat(true)
	game:initialize()

	keys:initialize(game.entities.player)
end

function love.draw()
	game.engine:draw()
end

function love.keypressed(key)
	if keys:handle(key) then
		game.engine:update()
		console:flush()
	end
end

function console:flush()
    if love.graphics and love.graphics.isActive() then
        love.graphics.clear(love.graphics.getBackgroundColor())
        love.graphics.origin()
        if love.draw then love.draw() end
        love.graphics.present()
    end
end