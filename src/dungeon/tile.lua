local Tile = class('tile')
function Tile:initialize(parent, x, y, blocked, block_sight)
    self.parent = parent
    self.x = x
    self.y = y
    self.blocked = blocked
    self.block_sight = block_sight or blocked
    self.visibility = {0,0,0,1}
    self.scent = 0
    
    self.color = nil
end
function Tile:getColor()
    if self.color then
        return self.color
    end
    if self.blocked then
        return colors.dark_orange
    else
        return colors.black
    end
end
return Tile