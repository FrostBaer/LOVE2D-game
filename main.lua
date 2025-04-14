local love = require("love")
local lick = require("lick")
lick.reset = true

local game = {
    state = {
        menu = true,
        game = false,
        pause = false,
        gameover = false,
    }
}

local player = {
    x = 10,
    y = 10,
    width = 10,
    height = 10
}

function love.load()
    X = 100
    Y = 100
    love.window.setMode(800, 600, {resizable=true})
    love.window.setTitle("Pixel Strategy")
    love.mouse.setVisible(false)
end
-- Game loop
function love.update(dt)  
    -- Player cursor 
    player.x, player.y = love.mouse.getPosition()

    -- circle movement
    X = X + 25 * dt
    if love.mouse.isDown(1) then
        X = love.mouse.getX()
        Y = love.mouse.getY()
    end
end
function love.draw()
    -- Draw the player
    love.graphics.rectangle("line", player.x, player.y, player.width, player.height)

    love.graphics.circle("fill", X, Y, 25)
    love.graphics.setColor(1, 0, 1)

    -- Draw the game state
    if game.state.menu then
        love.graphics.print("Menu", 10, 10)
    elseif game.state.game then
        love.graphics.print("Game", 10, 10)
    elseif game.state.pause then
        love.graphics.print("Pause", 10, 10)
    elseif game.state.gameover then
        love.graphics.print("Game Over", 10, 10)
    end
    
end

function love.keypressed(key)
    if key == "escape" then
        love.event.quit()
    end
end