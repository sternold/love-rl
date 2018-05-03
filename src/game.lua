local Drawing = require 'src.systems.drawing'
local Dying = require 'src.systems.dying'

local Player = require 'src.entities.player'

local generator = require 'src.dungeon.generator'

local Game = class('game', Entity)
function Game:initialize()
    Entity.initialize(self)
    self.engine = Engine()
    self.map = generator.generate(100, 100)
    self.player = Player(self, 1, 1)
    self.engine:addEntity(self.player)
    self.engine:addSystem(Drawing(), "draw")
    self.engine:addSystem(Dying(), "update")
end

return Game