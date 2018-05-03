local Drawing = require 'src.systems.drawing'
local Dying = require 'src.systems.dying'

local Player = require 'src.entities.player'

local game = {
    entities = {
        player = nil
    }
}
function game:initialize()
    self.engine = Engine()
    self.entities.player = Player(1, 1)
    self.engine:addEntity(self.entities.player)
    self.engine:addSystem(Drawing(), "draw")
    self.engine:addSystem(Dying(), "update")
end

return game