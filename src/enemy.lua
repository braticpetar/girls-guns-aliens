local Enemy = {}
local enemies = {}
local spawnTimer = 0

function Enemy.update(dt, player)
  spawnTimer = spawnTimer - dt
  if spawnTimer <= 0 then
    Enemy.spawn()
    spawnTimer = 2
  end

  for i = #enemies, 1, -1 do
    local e = enemies[i]
    local angle = math.atan2(player.y - e.y, player.x - e.x)
    e.x = e.x + math.cos(angle) * e.speed * dt
    e.y = e.y + math.sin(angle) * e.speed * dt

    -- Collide with player
    local dist = math.sqrt((player.x - e.x) ^ 2 + (player.y - e.y) ^ 2)
    if dist < e.radius + player.radius then
      player.health = player.health - 10
      table.remove(enemies, i)
    end

    -- Collide with bullets
    local bullets = require("src.weapon").getAll()
    for j = #bullets, 1, -1 do
      local b = bullets[j]
      if math.sqrt((b.x - e.x) ^ 2 + (b.y - e.y) ^ 2) < e.radius then
        table.remove(enemies, i)
        table.remove(bullets, j)
        break
      end
    end
  end

  if player.health <= 0 then
    love.event.quit()
  end
end

function Enemy.draw()
  love.graphics.setColor(0.8, 0.1, 0.1)
  for _, e in ipairs(enemies) do
    love.graphics.circle("fill", e.x, e.y, e.radius)
  end
end

function Enemy.spawn()
  local side = love.math.random(1, 4)
  local x, y
  if side == 1 then
    x = 0; y = love.math.random(0, 600)
  elseif side == 2 then
    x = 800; y = love.math.random(0, 600)
  elseif side == 3 then
    x = love.math.random(0, 800); y = 0
  else
    x = love.math.random(0, 800); y = 600
  end

  table.insert(enemies, { x = x, y = y, speed = 100, radius = 15 })
end

return Enemy
