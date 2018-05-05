local Tile = require 'src.dungeon.tile'

local Map = class("map")
function Map:initialize(w, h)
    self.width = w
    self.height = h
    self.children = {}

    self:clear(true)
end
function Map:clear(blocked)
    for x = 0, self.width do
        for y = 0, self.height do
            self:insert(x, y, Tile(self, x, y, blocked))
        end
    end
end
function Map:insert(x, y, tile)
    self.children[self.width * x + y] = tile
end
function Map:point(x, y)
    return self.children[self.width * x + y]
end
function Map:is_blocked(x, y)
    return self:point(x,y).blocked
end
function Map:draw()
    for _, tile in pairs(self.children) do
        if self:is_blocked(tile.x, tile.y) then
            console:print(' ', tile.x, tile.y, nil, tile:getColor())
        else
            console:print(' ', tile.x, tile.y, nil, tile:getColor())
        end
    end
end
function Map:draw_overlay()
    for _, tile in pairs(self.children) do
        console:print(' ', tile.x, tile.y, nil, tile.visibility)
    end
end
return Map