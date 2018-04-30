console = require 'loveconsole.console'
colors = require 'loveconsole.colors'
class = require 'middleclass'
binser = require 'binser'
lovetoys = require 'lovetoys.lovetoys'

map = {}

function love.load()
    lovetoys.initialize()
    console.initialize({
        extend = true,
        columns = 80,
        rows = 50,
        scale = 16,
        font = "res/fonts/press-start-2p.ttf"
    })
end

function love.update(dt)

end

function love.draw()
    console.fill()
end