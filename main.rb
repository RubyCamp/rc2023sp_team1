require "dxruby"
require_relative "player"
require_relative "map"
require_relative "gravity"
require_relative "door"
require_relative "block"

Window.width = 600
Window.height = 400
Window.bgcolor = C_WHITE

player = Player.new
map = Map.new
door = Door.new(0,0,200,100,player)
block = Block.new

Window.loop do
    map_x = (player.x / 20).abs
    map_y = ((player.y + 50) / 20).abs
    block_x = (block.x / 20).abs
    block_y = ((block.y + 80) / 20).abs
    player_gravity = Gravity.new(map_x,map_y,player)
    block_gravity = Gravity.new(block_x,block_y,block)
    player.draw
    player.move
    map.draw
    gravity.fall
    door.draw
    block.draw
    player_gravity.fall
    block_gravity.fall
    arr = [player,block]
    if Sprite.check(arr) then
        player.push
        block.move
    end

end