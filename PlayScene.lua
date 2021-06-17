local BG_COLOR = {
    red   = 63/255,
    green = 48/255,
    blue  = 71/255,
}
local SCORE_COLOR = {
    red   = 245/255,
    green = 133/255,
    blue  = 63/255,
}
local SCORE_FONT = love.graphics.newFont(20)

local Scene = {}

function Scene.load()
    Object = require "classic"
    require "utils"
    require "GameObj"
    require "Ship"
    require "Asteroid"

    ship = Ship(0, 0)
    asteroids = Asteroid.spawn(20)
    score = 0

    love.graphics.setBackgroundColor(
        BG_COLOR.red,
        BG_COLOR.green,
        BG_COLOR.blue
    )
    love.mouse.setVisible(false)
    love.mouse.setPosition(
        love.graphics.getWidth() / 2,
        love.graphics.getHeight() / 2
    )
end

function Scene.update(dt)
    ship:update(dt)
    for _, v in ipairs(asteroids) do
        v:update(dt)
        if (checkCollision(v, ship)) then
            MainScene = "EndScene"
            EndScore = score
            love.load()
            return
        end
    end

    Asteroid.classUpdate(dt, asteroids)

    score = score + dt
end

function Scene.draw()
    ship:draw()

    for _, v in ipairs(asteroids) do
        v:draw()
    end

    love.graphics.setColor(
        SCORE_COLOR.red, 
        SCORE_COLOR.green, 
        SCORE_COLOR.blue
    )
    love.graphics.print(math.floor(score), SCORE_FONT, 10, 10)
end

function Scene.keypressed()

end

return Scene