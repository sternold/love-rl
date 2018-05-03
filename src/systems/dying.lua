local Dying = class("dying", System)

function Dying:update()
    for _, entity in pairs(self.targets) do
        local object =  entity:get("object")
        local fightable =  entity:get("fightable")
        local drawable =  entity:get("drawable")
        if fightable.hp <= 0 then
            object.name = "Remains of " .. object.name
            drawable.character = '%'
            drawable.color = colors.red
        end
    end
end

function Dying:requires()
    return {"object", "fightable", "drawable"}
end

return Dying