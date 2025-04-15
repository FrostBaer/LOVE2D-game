local love = require("love")
local Colours = require("Colours")
local Map = require("Map")
local Menu = require("menu")
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

local menu = Menu:new()
local map = Map:new()

local frog = Frog(love.graphics.getWidth() - 400, love.graphics.getHeight() - 50, 10)
local powerup = Powerups(0, love.graphics.getHeight() - 100)
local cars = {}


function love.load()    
    love.window.setMode(800, 600, { resizable = true })
    love.window.setTitle("Frogger")
    love.mouse.setVisible(false)

    math.randomseed(os.time())
    for i = 1, 10 do
        math.random()
    end

    for i = 1, 10 do
        local x = math.random(0, love.graphics.getWidth())
        local y = math.random(0, (love.graphics.getHeight() - 100))
        local speed = math.random(10, 100)
        local type = i % 3 + 1
        local car = Cars(x, y, speed, true, type)
        car:init()
        print("Car " .. i .. ": " .. car.type .. " width: " .. car.width)
        table.insert(cars, car)
    end
end

-- Game loop
function love.update(dt)
    -- Player cursor
    player.x, player.y = love.mouse.getPosition()
    if game.state.game then
        -- Cars
        for _, car in ipairs(cars) do
            car:update(dt)
            if car:hit(frog.x, frog.y, frog.width, frog.height) then
                frog:die()
                game.state.gameover = true
                game.state.game = false
                game.state.pause = false
            end
        end

        -- Powerups
        powerup:update(dt)
    end
end

function love.draw()
    -- Draw the game state
    if game.state.menu then
        -- love.graphics.print("Menu", love.graphics.getWidth() / 2, love.graphics.getHeight() / 2)
        Menu:draw()
    elseif game.state.game then
        love.graphics.print("Game", 10, 10)
        --Map
        Map:draw()
        --Frog
        frog:draw()
        -- Cars
        for _, car in ipairs(cars) do
            car:draw()
        end
        -- Powerups
        powerup:draw()
    elseif game.state.pause then
        love.graphics.print("Pause", 10, 10)
    elseif game.state.gameover then
        --Map
        Map:draw()
        --Frog
        frog:draw()
        -- Cars
        for _, car in ipairs(cars) do
            car:draw()
        end
        -- Powerups
        powerup:draw()
        love.graphics.setColor(Colours.RED)
        love.graphics.printf("Game Over", 0, love.graphics.getHeight() / 2, love.graphics.getWidth(), "center")  
    end

    -- Measure FPS
    love.graphics.setColor(Colours.GRAY)
    love.graphics.print("FPS: " .. love.timer.getFPS(), Fonts.MENU3, 10, love.graphics.getHeight() - 40)

    -- Draw the player cursor
    love.graphics.setColor(Colours.WHITE)
    love.graphics.rectangle("line", player.x, player.y, player.width, player.height)
end

function love.keypressed(key)
    print("Key pressed: " .. key)
    if game.state.game then
        if key == "up" then
            frog:jump()
        end
        if key == "left" then
            frog:left()
        end
        if key == "right" then
            frog:right()
        end
    end
    if game.state.menu then
        if key == "up" then
            Menu.selected = Menu.selected - 1
            if Menu.selected < 1 then
                Menu.selected = #Menu.options
            end
        elseif key == "down" then
            Menu.selected = Menu.selected + 1
            if Menu.selected > #Menu.options then
                Menu.selected = 1
            end
        elseif key == "return" then
            if Menu.selected == 1 then
                game.state.menu = false
                game.state.game = true
                game.state.pause = false
            elseif Menu.selected == 2 then
                -- Options menu (not implemented)
            elseif Menu.selected == 3 then
                love.event.quit()
            end
        end
    end
    if game.state.gameover then
        if key == "return" then
            game.state.gameover = false
            game.state.menu = true
            game.state.game = false
            game.state.pause = false
        end
    end
    if key:lower() == "p" then
        game.state.pause = not game.state.pause
        game.state.game = not game.state.game
    end
    if key == "escape" then
        love.event.quit()
    end
end
