require "dxruby"
require_relative "player"
# require_relative "soko"
require_relative "map"

Window.width = 600
Window.height = 400
Window.bgcolor = C_WHITE

player = Player.new
map = Map.new

Window.loop do
    map.draw

    player.draw
    player.move
    map.draw
end