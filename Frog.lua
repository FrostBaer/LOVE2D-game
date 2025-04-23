local Colour = require("Colours")
local PowerupTypes = require("Powerups")
local Frog = Object:extend()

function Frog:new(x, y, speed)
    self.imageAlive = love.graphics.newImage("images/frog.png")
    self.imageDead = love.graphics.newImage("images/frog_dead.png")
    self.imageSize = 0.5

    self.x = x
    self.y = y
    self.width = self.imageAlive:getWidth() * self.imageSize
    self.height = self.imageAlive:getHeight() * self.imageSize
    self.speed = speed or 100
    self.alive = true
    self.powerup = 1
end

function Frog:reset()
    self.x = love.graphics.getWidth() - 400
    self.y = love.graphics.getHeight() - 50
    self.alive = true
end

function Frog:jump()
    if self.alive then
        if self.powerup == 1 then
            self.y = self.y - self.speed*2
        else 
            self.y = self.y - self.speed
        end
    end
end

function Frog:left()
    if self.alive then
        self.x = self.x - self.speed
    end
end

function Frog:right()
    if self.alive then
        self.x = self.x + self.speed
    end
end

function Frog:die()
    self.alive = false
end

function Frog:draw()
    if self.alive then
        love.graphics.draw(self.imageAlive, self.x, self.y, 0, self.imageSize, self.imageSize)
    else
        love.graphics.draw(self.imageDead, self.x, self.y, 0, self.imageSize, self.imageSize)
    end
end

return Frog
