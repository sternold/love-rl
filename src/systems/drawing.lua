local Drawing = class("drawing", System)

function Drawing:draw()
    for _, entity in pairs(self.targets) do
        local location =  entity:get("location")
        local drawable =  entity:get("drawable")
        console:print(drawable.character, location.x, location.y, drawable.color)
    end
end

function Drawing:requires()
    return {"location", "drawable"}
end

return Drawing