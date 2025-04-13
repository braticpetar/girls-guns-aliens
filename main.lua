local Player = require "src.player"
local Weapon = require "src.weapon"
local Enemy = require "src.enemy"
local UI = require "src.UI"

function love.load()
    Player.load()
end

function love.update(dt)
    Player.update(dt)
    Weapon.update(dt)
    Enemy.update(dt, Player)
end

function love.draw()
    Player.draw()
    Weapon.draw()
    Enemy.draw()
    UI.draw(Player)
end

function love.mousepressed(x, y, button)
    if button == 1 then
        Weapon.shoot(Player.x, Player.y, x, y)
    end
end
