local Colour = require("Colours")
local Frog = Object:extend()

function Frog:new(x, y, speed)
    self.x = x
    self.y = y
    self.speed = speed or 100
end

function Frog:update(dt)  
    love.keyboard.setKeyRepeat(false)
    if(love.keyboard.isDown("up")) then
        self.y = self.y - self.speed * dt
    end
    if(love.keyboard.isDown("down")) then
        self.y = self.y + self.speed * dt
    end
    if(love.keyboard.isDown("left")) then
        self.x = self.x - self.speed * dt
    end
    if(love.keyboard.isDown("right")) then
        self.x = self.x + self.speed * dt
    end
    if(love.keyboard.isDown("space")) then
        self.y = self.y - self.speed * dt * 2
    end
end
function Frog:draw()
    love.graphics.setColor(Colour.GREEN)
    love.graphics.ellipse("fill", self.x, self.y, 25, 15, 16)
    love.graphics.setColor(Colour.WHITE)
end
return Frog