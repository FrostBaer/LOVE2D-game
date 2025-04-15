Object = require("helpers.classic")

local Car = Object:extend()

function Car:new(x, y, speed, forward, type)
    self.imageCar = love.graphics.newImage("images/car.png")
    self.imageTruck = love.graphics.newImage("images/truck.png")
    self.imageLkw = love.graphics.newImage("images/lkw.png")
    self.imageSize = 0.7

    self.x = x
    self.y = y
    self.width = 0
    self.height = 0
    self.speed = speed or 100
    self.forward = forward or true
    self.type = type
end

function Car:init()
    if self.type == 1 then
        self.width = self.imageCar:getWidth() * self.imageSize
        self.height = self.imageCar:getHeight() * self.imageSize
    elseif self.type == 2 then
        self.width = self.imageTruck:getWidth() * self.imageSize
        self.height = self.imageTruck:getHeight() * self.imageSize
    else
        self.width = self.imageLkw:getWidth() * self.imageSize
        self.height = self.imageLkw:getHeight() * self.imageSize
    end
end

function Car:update(dt)
    self.x = self.x + self.speed * dt
    if self.x > love.graphics.getWidth() then
        self.x = -50
    end
    -- if love.mouse.isDown(1) then
    --     self.x = love.mouse.getX()
    --     self.y = love.mouse.getY()
    -- end
end

function Car:draw()
    if self.type == 1 then
        love.graphics.draw(love.graphics.newImage("images/car.png"), self.x, self.y, 0, 0.8, 0.8)
    elseif self.type == 2 then
        love.graphics.draw(love.graphics.newImage("images/truck.png"), self.x, self.y, 0, 0.8, 0.8)
    else
        love.graphics.draw(love.graphics.newImage("images/lkw.png"), self.x, self.y, 0, 0.8, 0.8)
    end
end

function Car:hit(x, y, width, height)
    return x < self.x + self.width and
        x + width > self.x and
        y < self.y + self.height and
        y + height > self.y
end

return Car
