local Object = require 'src.components.object'
local Location = require 'src.components.location'
local Drawable = require 'src.components.drawable'
local Fightable = require 'src.components.fightable'
local Playable = require 'src.components.playable'


local Player = class("Player", Entity)

function Player:initialize(x, y)
    Entity.initialize(self)
    self:addMultiple({
        Object("Player", true),
        Location(x, y),
        Drawable('@', colors.yellow),
        Fightable(10, 10),
        Playable()
    })
end

function Player:move(dx, dy)
    local x = self:get("location").x + dx
    local y = self:get("location").y + dy

    self:get("location").x = x
    self:get("location").y = y
end

return Player