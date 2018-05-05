local Map = require 'src.dungeon.map'
local Room = require 'src.dungeon.room'
local Tile = require 'src.dungeon.tile'

local generator = {
    floor_sizes = {{1, 50}, {4, 60}, {8, 75}, {10, 30}},
    room_min_sizes = {{1, 4}, {5, 8}, {10, 14}},
    room_max_sizes = {{1, 8}, {5, 12}, {10, 20}}
}
function generator:generate(floor)
    self.floor = floor
    local w = self:floor_value(self.floor_sizes)
    local h = self:floor_value(self.floor_sizes)

    --initialize empty map
    local map = Map(w, h)
    local player_coords = self:generate_rooms(map)
    return map, player_coords
end
function generator:generate_rooms(map)
    local result = {}

    local rooms = {}
    local room_min_size = self:floor_value(self.room_min_sizes)
    local room_max_size = self:floor_value(self.room_max_sizes)
    for r=0, (map.width * map.height) / 100 do
        local w = love.math.random(room_min_size, room_max_size)
        local h = love.math.random(room_min_size, room_max_size)
        local x = love.math.random(1, map.width - w - 1)
        local y = love.math.random(1, map.height - h - 1)

        local new_room = Room(x, y, w, h)
        local failed = false
        for _, room in ipairs(rooms) do
            if new_room:intersect(room) then
                failed = true
                break
            end
        end
        if not failed then
            self:create_room(map, new_room)
            local new_x, new_y = new_room:center()
            if table.maxn(rooms) == 0 then 
                result.x = new_x
                result.y = new_y
            else 
                local prev_x, prev_y = rooms[#rooms]:center()
                if love.math.random(0, 1) == 1 then
                    self:create_h_tunnel(map, prev_x, new_x, prev_y)
                    self:create_v_tunnel(map, prev_y, new_y, new_x)
                else
                    self:create_v_tunnel(map, prev_y, new_y, prev_x)
                    self:create_h_tunnel(map, prev_x, new_x, new_y)
                end                   
            end
            table.insert(rooms, new_room)
        end
    end
    return result
end
function generator:create_room(map, room)
    for x=room.x1, room.x2 do
        for y=room.y1, room.y2 do
            map:insert(x, y, Tile(map, x, y, false))
        end
    end
end

function generator:create_h_tunnel(map, x1, x2, y)
    for x=math.min(x1, x2), math.max(x1, x2) do
        map:insert(x, y, Tile(map, x, y, false))
    end
end

function generator:create_v_tunnel(map, y1, y2, x)
    for y=math.min(y1, y2), math.max(y1, y2) do
        map:insert(x, y, Tile(map, x, y, false))
    end
end
function generator:floor_value(pairs)
    for _, pair in ipairs(pairs) do
        if self.floor >= pair[1] then
            return pair[2]
        end
    end
    return 0
end
return generator