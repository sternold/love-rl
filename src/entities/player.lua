local Object = require 'src.components.object'
local Location = require 'src.components.location'
local Drawable = require 'src.components.drawable'
local Fightable = require 'src.components.fightable'
local Playable = require 'src.components.playable'


local Player = class("Player", Entity)

function Player:initialize(parent, x, y)
    Entity.initialize(self)
    self.parent = parent
    self:addMultiple({
        Object("Player", true),
        Location(x, y),
        Drawable('@', colors.yellow),
        Fightable(10, 1, 1, 10),
        Playable(1, 200, 150, 10, 2)
    })
end

function Player:move(dx, dy)
    local x = self:get("location").x + dx
    local y = self:get("location").y + dy

    if not self.parent.map:is_blocked(x, y) then
        self:get("location").x = x
        self:get("location").y = y
    end
end

return Player