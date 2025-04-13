local UI = {}

function UI.draw(player)
  local barWidth = 200
  local ratio = player.health / player.maxHealth
  love.graphics.setColor(0.3, 0.3, 0.3)
  love.graphics.rectangle("fill", 20, 20, barWidth, 20)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", 20, 20, barWidth * ratio, 20)
  love.graphics.setColor(1, 1, 1)
  love.graphics.rectangle("line", 20, 20, barWidth, 20)
end

return UI
