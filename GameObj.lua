GameObj = Object:extend()

function GameObj:new(x, y, radius, color)
    self.x = x
    self.y = y
    self.radius = radius
    self.color = color
end

function GameObj:draw()
    love.graphics.setColor(self.color.red, self.color.green, self.color.blue)
    love.graphics.circle("fill", self.x, self.y, self.radius, 48)
end