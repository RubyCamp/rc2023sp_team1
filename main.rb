require "dxruby"
require_relative "player"
require_relative "soko"
require_relative "map"

Window.width = 600
Window.height = 400
Window.bgcolor = C_WHITE

player = Player.new

Window.loop do
    player.draw
    player.move
end