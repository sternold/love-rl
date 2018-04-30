local colors = {
    light_red       = {1.0, 0.2,   0.2,   1.0},
    red             = {1.0, 0,    0,    1.0},
    dark_red        = {0.2, 0,    0,    1.0},

    light_orange    = {1.0, 0.2,  0.2,   1.0},
    orange          = {1.0, 0.5,  0,    1.0},
    dark_orange     = {0.2, 0.25,   0,    1.0},

    light_yellow    = {1.0, 1.0,  0.2,   1.0},
    yellow          = {1.0, 1.0,  0.2,   1.0},
    dark_yellow     = {0.2, 0.2,  0,    1.0},

    light_green     = {0.2,  1.0,  0.2,   1.0},
    green           = {0,   1.0,  0,    1.0},
    dark_green      = {0,   0.2,  0,    1.0},

    light_blue      = {0.2,  1.0,  1.0,  1.0},
    blue            = {0.2,  0.2,  1.0,  1.0},
    dark_blue       = {0.2,  0.2,   1.0,  1.0},

    light_purple    = {0.2, 0.2,   1.0,  1.0},
    purple          = {0.2, 0,    1.0,  1.0},
    dark_purple     = {75,  0,    0.2,  1.0},

    light_pink      = {1.0, 0.2,   1.0,  1.0},
    pink            = {1.0, 0,    1.0,  1.0},
    dark_pink       = {0.2, 0,    0.2,  1.0},

    white           = {1.0, 1.0,  1.0,  1.0},
    black           = {0,   0,    0,    1.0},
}

function colors.random()
    local r = love.math.random(0, 100) / 100
    local g = love.math.random(0, 100) / 100
    local b = love.math.random(0, 100) / 100
    return {r, g, b, 1.0}
end

return colors