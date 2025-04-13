local Player = {
  x = 400,
  y = 300,
  speed = 200,
  radius = 20,
  health = 100,
  maxHealth = 100
}

function Player.load() end

function Player.update(dt)
  if love.keyboard.isDown("w") then Player.y = Player.y - Player.speed * dt end
  if love.keyboard.isDown("s") then Player.y = Player.y + Player.speed * dt end
  if love.keyboard.isDown("a") then Player.x = Player.x - Player.speed * dt end
  if love.keyboard.isDown("d") then Player.x = Player.x + Player.speed * dt end
end

function Player.draw()
  love.graphics.setColor(0.2, 0.8, 0.2)
  love.graphics.circle("fill", Player.x, Player.y, Player.radius)
end

return Player
