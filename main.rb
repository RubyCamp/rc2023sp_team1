require "dxruby"
require_relative "start"
require_relative "player"
require_relative "map"
require_relative "gravity"
require_relative "door"
require_relative "block"
require_relative "design"


Window.width = 600
Window.height = 400
Window.bgcolor = [32,178,170]

start = Start.new
player = Player.new
map = Map.new(1)
door = Door.new(0,0,200,100,player)
state = 0
font = Font.new(32)
design = Design.new

block = []
map.create_move_block

timeout_seconds = 5


Window.loop do
    case state
    when 0
        start.draw
        state = 1 if Input.key_push?(K_SPACE)
    
    when 1
        design.cloud(100,50)
        design.cloud(300,30)
        design.cloud(500,50)
        map_x = (player.x / 20).abs
        map_y = ((player.y + 50) / 20).abs
        player_gravity = Gravity.new(map_x,map_y,player)
        player.speed(4)
        player_gravity.ground_collision
        player.draw
        player.move
        player.jump
        map.draw
        player_gravity.fall

        for i in 0..3
            arr = [player,map.move_blocks[i]]
            if Sprite.check(arr) then
                # p "hhh"
                player.push
                map.move_blocks[i].move
            end
        end
        state = 2 if player.x == 500
    
    when 2
        Window.draw_font(200,200,"GAME CLEAR",font, color:C_WHITE)
        if Input.key_push?(K_SPACE)
            state = 1 
            player.x = 25
            player.y = 150
        end
    end
end