local Info = class('info')
function Info:initialize(parent)
    self.parent = parent
    self.viewport = {
        width = console.config.buffer_width - parent.viewport.width,
        heigth = console.config.buffer_height,
        x = parent.viewport.width + 1,
        y = 0
    }
end
function Info:draw()
    local fightable = self.parent.player:get("fightable")
    local health    = "Health:  " .. fightable.hp .. "/" .. fightable.max_hp
    local defense   = "Defense: " .. fightable.defense
    local power     = "Power:   " .. fightable.power
    console:print(health, self.viewport.x+1, self.viewport.y+1)
    console:print(defense, self.viewport.x+1, self.viewport.y+2)
    console:print(power, self.viewport.x+1, self.viewport.y+3)


end
return Info