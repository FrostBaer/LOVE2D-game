local Powerups = Object:extend()
function Powerups:new(x, y)
    self.x = x
    self.y = y
    self.radius = 10
    self.speed = 30
end

function Powerups:update(dt)
    self.x = self.x + self.speed * dt  
    if self.x > love.graphics.getWidth() then
        self.x = -50
        self.y = math.random(0, love.graphics.getHeight() - 100)
    end
end

function Powerups:draw()
    love.graphics.setColor(Colours.BLUE)
    love.graphics.circle("fill", self.x, self.y, self.radius)
    love.graphics.setColor(Colours.WHITE)
end

return Powerups