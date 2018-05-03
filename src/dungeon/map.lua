local Map = class("map")
function Map:initialize(w, h)
    self.width = w
    self.height = h
    self.content = {}
end
function Map:insert(x, y, tile)
    self.content[self.width * x + y] = tile
end
function Map:point(x, y)
    return self.content[self.width * x + y]
end
function Map:is_blocked(x, y)
    return self:point(x,y).blocked
end
function Map:draw()
    for index, tile in ipairs(self.content) do
        x = index % self.width
        y = math.floor(index / self.width)
        if self:is_blocked(x, y) then
            console:print('#', x, y)
        else
            console:print(' ', x, y, colors.white, colors.dark_green)
        end
    end
end
return Map