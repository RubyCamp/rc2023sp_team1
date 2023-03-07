require "dxruby"
require_relative "player"
require_relative "map"
require_relative "gravity"

Window.width = 600
Window.height = 400
Window.bgcolor = C_WHITE

player = Player.new
map = Map.new

Window.loop do
    map_x = (player.x / 20).abs
    map_y = ((player.y + 50) / 20).abs
    gravity = Gravity.new(map_x,map_y,player)
    player.draw
    player.move
    map.draw
    gravity.fall
end