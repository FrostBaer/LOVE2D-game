Object = require("helpers.classic")

local Menu = Object:extend()

function Menu:new()
    self.title = "Frogger"
    self.menuItems = {"Play", "Options", "Exit"}
    self.options = {"Easy", "Normal", "Hard"}
    self.selected = 1
end

function Menu:draw()
    love.graphics.setFont(Fonts.MENU2)
    love.graphics.setColor(Colours.WHITE)
    love.graphics.printf(self.title, 0, love.graphics.getHeight() / 2 - 100, love.graphics.getWidth(), "center")

    for i, item in ipairs(self.menuItems) do
        if i == self.selected then
            love.graphics.setColor(Colours.GREEN)
        else
            love.graphics.setColor(Colours.WHITE)
        end
        love.graphics.printf(item, 0, love.graphics.getHeight() / 2 + (i * 50), love.graphics.getWidth(), "center")
    end
end

function Menu:optionsDraw()
    love.graphics.setFont(Fonts.MENU2)
    love.graphics.setColor(Colours.WHITE)
    love.graphics.printf("Options", 0, love.graphics.getHeight() / 2 - 100, love.graphics.getWidth(), "center")

    for i, option in ipairs(self.options) do
        if i == self.selected then
            love.graphics.setColor(Colours.GREEN)
        else
            love.graphics.setColor(Colours.WHITE)
        end
        love.graphics.printf(option, 0, love.graphics.getHeight() / 2 + (i * 50), love.graphics.getWidth(), "center")
    end
end

return Menu