local Fov = class("fov", System)

Fov.DIRECTIONS = {
    up          = {dx=0,    dy=-1}, 
    down        = {dx=0,    dy=1}, 
    left        = {dx=-1,   dy=0}, 
    right       = {dx=1,    dy=0}, 
    downleft    = {dx=-1,   dy=-1}, 
    upleft      = {dx=1,    dy=-1}, 
    downright   = {dx=-1,   dy=1}, 
    upright     = {dx=1,    dy=1}, 
    none        = {dx=0,    dy=0}
}

Fov.OVERLAYS = {
    hidden = {0,0,0,1},
    visited = {0,0,0,.5},
    visible = {0,0,0,0}
}

function Fov:draw()
    for _, entity in ipairs(self.targets) do
        for _,tile in pairs(entity.parent.map.children) do
            if tile.visibility == Fov.OVERLAYS.visible then
                tile.visibility = Fov.OVERLAYS.visited
            end
        end
        for _,v in pairs(Fov.DIRECTIONS) do
            self:cast_light(entity, 1, 1, 0, 0, v.dx, v.dy, 0)
            self:cast_light(entity, 1, 1, 0, v.dx, 0, 0, v.dy)
        end
    end
end

function Fov:cast_light(entity, row, cstart, cend, xx, xy, yx, yy)
        local location = entity:get('location')
        local playable = entity:get('playable')
        local map = entity.parent.map
        
        local startx, starty = location.x, location.y
        local radius = playable.sense_range
        local start = cstart
    
        local new_start = 0
        if start < cend then
            return
        end
    
        local width = map.width
        local height = map.height
    
        local blocked = false
        for distance = row, radius do
            local deltay = distance * -1
            for deltax = distance * -1, 0 do
                local currentx = startx + deltax * xx + deltay * xy
                local currenty = starty + deltax * yx + deltay * yy 
                local leftslope = (deltax - .5) / (deltay +.5)
                local rightslope = (deltax + .5) / (deltay - .5)
            
                if not (currentx >= 0 and currenty >= 0 and currentx < width and currenty < height) or start < rightslope then
                    --Continue
                elseif cend > leftslope then
                    break;
                else
                    if self:circle_radius(deltax, deltay, 0) <= radius then
                        map:point(currentx, currenty).visibility = Fov.OVERLAYS.visible
                    end
                
                      if blocked then
                        if map:point(currentx, currenty).block_sight then
                            new_start = rightslope
                            --Continue
                        else 
                            blocked = false
                            start = new_start
                        end
                    else
                        if map:point(currentx, currenty).block_sight and distance < radius then
                            blocked = true
                            self:cast_light(entity, distance + 1, start, leftslope, xx, xy, yx, yy)
                            new_start = rightslope
                        end
                    end
                end
            end
            if blocked then
                break
            end
        end
end

function Fov:circle_radius(x, y, z)
    local dx = math.abs(x)
    local dy = math.abs(y)
    local dz = math.abs(z)
return math.sqrt(dx*dx + dy*dy + dz*dz)
end

function Fov:requires()
    return {"location", "playable"}
end

return Fov