local Map = require 'src.dungeon.map'

local generator = {}
function generator.generate(w, h)
    local map = Map(w, h)
    for x = 0, w do
        for y = 0, h do
            map:insert(x, y, {blocked = false})
        end
    end

    map:insert(5, 10, {blocked = true})
    map:insert(6, 10, {blocked = true})
    map:insert(7, 10, {blocked = true})

    return map
end
return generator