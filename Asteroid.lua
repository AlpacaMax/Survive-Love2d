local ASTEROID_COLOR = {
    red   = 232/255,
    green = 233/255,
    blue  = 235/255,
}
local ASTEROID_RADIUS = 10
local ASTEROID_MIN_SPEED = 80
local ASTEROID_MAX_SPEED = 200

Asteroid = GameObj:extend()
Asteroid.spawnTimer = 0

function Asteroid:new()
    x, y, self.speed_x, self.speed_y = Asteroid.randomPosSpeed()
    Asteroid.super.new(self, x, y, ASTEROID_RADIUS, ASTEROID_COLOR)
end

function Asteroid:update(dt)
    self.x = self.x + self.speed_x * dt
    self.y = self.y + self.speed_y * dt

    if (self.x - self.radius <= 0 
        and self.speed_x < 0)
    or (self.x + self.radius >= love.graphics.getWidth() 
        and self.speed_x > 0) then
        self.speed_x = -self.speed_x
    end

    if (self.y - self.radius <= 0
        and self.speed_y < 0)
    or (self.y + self.radius >= love.graphics.getHeight()
        and self.speed_y > 0) then
        self.speed_y = -self.speed_y
    end
end

function Asteroid.classUpdate(dt, asteroids)
    Asteroid.spawnTimer = Asteroid.spawnTimer + dt
    if (Asteroid.spawnTimer > 3) then
        table.insert(asteroids, Asteroid())
        Asteroid.spawnTimer = 0
    end
end

function Asteroid.randomPosSpeed()
    local fourEdges = {
        {
            love.math.random(0, love.graphics.getWidth()), 
            -ASTEROID_RADIUS
        },
        {
            love.math.random(0, love.graphics.getWidth()), 
            love.graphics.getHeight() + ASTEROID_RADIUS
        },
        {
            -ASTEROID_RADIUS, 
            love.math.random(0, love.graphics.getHeight())
        },
        {
            love.graphics.getWidth() + ASTEROID_RADIUS, 
            love.math.random(0, love.graphics.getHeight())
        }
    }
    local init_xy = fourEdges[love.math.random(1, 4)]

    local angle = math.rad(love.math.random(0, 180))
    local speed = love.math.random(ASTEROID_MIN_SPEED, ASTEROID_MAX_SPEED)
    local speed_x = math.cos(angle) * ASTEROID_MIN_SPEED
    local speed_y = math.sin(angle) * ASTEROID_MAX_SPEED

    return init_xy[1], init_xy[2], speed_x, speed_y
end

function Asteroid.spawn(n)
    local asteroids = {}
    for i = 1, n do
        asteroids[i] = Asteroid()
    end
    return asteroids
end