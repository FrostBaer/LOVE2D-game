local Colour = require("Colours")
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
end

function Frog:jump()
    if self.alive then
        self.y = self.y - self.speed * 2
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
