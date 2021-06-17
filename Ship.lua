local SHIP_COLOR = {
    red   = 229/255,
    green = 98/255,
    blue  = 94/255,
}
local SHIP_RADIUS = 20

Ship = GameObj:extend()

function Ship:new(x, y)
    Ship.super.new(self, x, y, SHIP_RADIUS, SHIP_COLOR)
end

function Ship:update()
    self.x, self.y = love.mouse.getPosition()
end