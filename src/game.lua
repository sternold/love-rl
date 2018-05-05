local Drawing = require 'src.systems.drawing'
local Fov = require 'src.systems.fov'
local Dying = require 'src.systems.dying'
local Player = require 'src.entities.player'
local generator = require 'src.dungeon.generator'
local Info = require 'src.managers.info'

local Game = class('game', Entity)
function Game:initialize(viewport)
    Entity.initialize(self)
    
    self.viewport = viewport
    self.map = nil
    self.player = nil
    
    self.engine = Engine()
    self.engine:addSystem(Drawing(), "draw")
    self.engine:addSystem(Fov(), "draw")
    self.engine:addSystem(Dying(), "update")
    
    self.ui = Info(self)
end

function Game:start()
    local map, player_coords = generator:generate(1)
    self.map = map
    self.player = Player(self, player_coords.x, player_coords.y)
    self.engine:addEntity(self.player)
end

return Game