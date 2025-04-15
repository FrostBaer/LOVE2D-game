Object = require("helpers.classic")

local Car = Object:extend()

function Car:new(x, y, width, height, speed, forward)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.speed = speed or 100
    self.forward = forward or true
    self.type = {"car", "truck", "lkw"}
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
    -- love.graphics.setColor(Colours.RED)
    -- love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    -- love.graphics.setColor(Colours.WHITE)
    if self.type == "car" then
        love.graphics.draw(love.graphics.newImage("images/car.png"), self.x, self.y, 0, 0.5, 0.5)
    elseif self.type == "truck" then
        love.graphics.draw(love.graphics.newImage("images/truck.png"), self.x, self.y, 0, 0.5, 0.5)
    else 
        love.graphics.draw(love.graphics.newImage("images/lkw.png"), self.x, self.y, 0, 0.5, 0.5)
    end
end

function Car:hit(x, y, width, height)
    return x < self.x + self.width and
        x + width > self.x and
        y < self.y + self.height and
        y + height > self.y
end

return Car