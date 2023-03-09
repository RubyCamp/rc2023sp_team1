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
stage = 1
map = Map.new(stage)
door = Door.new(0,0,200,100,player)
state = 0

time = 600
font = Font.new(32)
design = Design.new

block = []
map.create_move_block(player)

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

        if time > -1
            Window.draw_font(520, 10, "残り#{time/60}秒", font,color:C_BLACK)
            time -= 1
            state = 1
        else
            Window.draw_font(520, 10, "時間切れ", font,color:C_BLACK)
            state = 3
        end

        for i in 0..3
            arr = [player,map.move_blocks[i]]
            if Sprite.check(arr) then
                # p "hhh"
                player.push
                map.move_blocks[i].move
            end
        end

        state = 2 if player.x >= 540
    
    when 2
        Window.draw_font(200,200,"GAME CLEAR",font, color:C_WHITE)
        if Input.key_push?(K_SPACE)
            state = 1 
            player.x = 25
        end

    when 3
        Window.draw_font(230,200,"GAME OVER",font,color:C_BLACK)
        if Input.key_push?(K_SPACE)
            state = 1
            player.x = 25
            
        end

    end
end