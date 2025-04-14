local Colours = require("Colours")
Object = require("helpers.classic")

local Map = Object:extend()
function Map:new()
    self.width = love.graphics.getWidth()
    self.height = love.graphics.getHeight()
    self.startY = 50
    self.goalY = love.graphics.getHeight() - 50
end

function Map:draw()
    love.graphics.setColor(Colours.GRAY)
    love.graphics.setLineWidth(10)
    love.graphics.line(0, self.startY, self.width, self.startY)
    love.graphics.line(0, self.goalY, self.width, self.goalY)
    love.graphics.setColor(Colours.YELLOW)
    love.graphics.rectangle("fill", 0, self.startY, self.width, self.height - self.startY)
    love.graphics.setColor(1, 1, 1)
    love.graphics.rectangle("fill", 0, self.goalY, self.width, self.height - self.goalY)
    love.graphics.setLineWidth(1)
end

return Map