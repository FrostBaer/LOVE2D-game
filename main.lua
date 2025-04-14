local lick = require("lick")
lick.reset = true

function love.load()
    X = 100
    Y = 100
    love.window.setMode(800, 600, {resizable=true})
    love.window.setTitle("Hello World")
end
-- Game loop
function love.update(dt)  
    X = X + 25 * dt
    if love.mouse.isDown(1) then
        X = love.mouse.getX()
        Y = love.mouse.getY()
    end
end
function love.draw()
    love.graphics.circle("fill", X, Y, 25)
    love.graphics.setColor(1, 0, 1)
end
function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end