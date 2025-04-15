local love = require("love")
local Colours = require("Colours")
local Map = require("Map")
local Cars = require("Cars")
local Frog = require("Frog")
local Powerups = require("Powerups")
local Fonts = require("Fonts")
-- hot reload
local lick = require("helpers.lick")

lick.reset = true

love.graphics.setFont(Fonts.MENU2)

local game = {
    state = {
        menu = false,
        game = true,
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

local map = Map:new()

local frog = Frog(love.graphics.getWidth() - 400, love.graphics.getHeight() - 50, 15)
local powerup = Powerups(0, love.graphics.getHeight() - 100)

local cars = {}
for i = 1, 10 do
    local x = math.random(0, love.graphics.getWidth())
    local y = math.random(0, (love.graphics.getHeight() - 100))
    local speed = math.random(10, 100)
    local car = Cars(x, y, 50, 25, speed)
    table.insert(cars, car)
end

function love.load()
    X = 100
    Y = 100
    love.window.setMode(800, 600, { resizable = true })
    love.window.setTitle("Frogger")
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

    -- Cars
    for _, car in ipairs(cars) do
        car:update(dt)
    end

    -- Frog
    frog:update(dt)

    -- Powerups
    powerup:update(dt)
end

function love.draw()
    -- Measure FPS
    love.graphics.print("FPS: " .. love.timer.getFPS(), Fonts.MENU, 10, love.graphics.getHeight() - 40)

    -- Draw the player cursor
    love.graphics.setColor(Colours.WHITE)
    love.graphics.rectangle("line", player.x, player.y, player.width, player.height)

    -- Draw the game state
    if game.state.menu then
        love.graphics.print("Menu", 10, 10)
    elseif game.state.game then
        love.graphics.print("Game", 10, 10)
        --Map 
        Map:draw()
        -- Cars
        for _, car in ipairs(cars) do
            car:draw()
        end

        --Frog
        frog:draw()

        -- Powerups
        powerup:draw()
    elseif game.state.pause then
        love.graphics.print("Pause", 10, 10)
    elseif game.state.gameover then
        love.graphics.print("Game Over", 10, 10)
    end
end

function love.keypressed(key)
    print("Key pressed: " .. key)
    if key == "up" then
        frog:jump()
    end
    if key == "escape" then
        love.event.quit()
    end
end
