local colors = require('lib.loveconsole.colors')

local console = {}
function console.initialize(props)
    if props == nil then 
        props = {} 
    end

    console.config = {}
    for name, value in pairs(props) do
        console.config[name] = value
    end

    love.graphics.setFont(love.graphics.newFont(console.config.font, console.config.scale))
    love.window.setMode(console.config.columns * console.config.scale, console.config.rows * console.config.scale)

    if console.config.extend then 
        love.graphics.console = console
    end
end
function console.print(line, col, row, text_color, background_color)
    if background_color then
        love.graphics.setColor(background_color)
        love.graphics.rectangle("fill", col * console.config.scale, row * console.config.scale, #line * console.config.scale, console.config.scale)
        love.graphics.setColor(colors.white) 
    end
        love.graphics.print({text_color or colors.white, line}, 
        col * console.config.scale, 
        row * console.config.scale) 
end
function console.fill()
    for x = 0, console.config.columns-1 do 
        for y = 0, console.config.rows-1 do 
            console.print(string.char(love.math.random(65, 89)), x, y, colors.random(), colors.random())
        end
    end
end

return console