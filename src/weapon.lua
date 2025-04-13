local Weapon = {}
local bullets = {}

function Weapon.shoot(x, y, tx, ty)
  local angle = math.atan2(ty - y, tx - x)
  table.insert(bullets, {
    x = x,
    y = y,
    angle = angle,
    speed = 500,
    radius = 5
  })
end

function Weapon.update(dt)
  for i = #bullets, 1, -1 do
    local b = bullets[i]
    b.x = b.x + math.cos(b.angle) * b.speed * dt
    b.y = b.y + math.sin(b.angle) * b.speed * dt

    if b.x < 0 or b.x > 800 or b.y < 0 or b.y > 600 then
      table.remove(bullets, i)
    end
  end
end

function Weapon.draw()
  love.graphics.setColor(1, 1, 0)
  for _, b in ipairs(bullets) do
    love.graphics.circle("fill", b.x, b.y, b.radius)
  end
end

function Weapon.getAll()
  return bullets
end

return Weapon
