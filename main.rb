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
map = Map.new(1)
door = Door.new(0,0,200,100,player)
state = 0
font = Font.new(32)

block = []
map.create_move_block

timeout_seconds = 5


Window.loop do
    case state
    when 0
        start_image = Image.load("start_image_new.png")
        Window.draw(0,0,start_image)
        state = 1 if Input.key_push?(K_SPACE)
    
    when 1
        map_x = (player.x / 20).abs
        map_y = ((player.y + 50) / 20).abs
        player_gravity = Gravity.new(map_x,map_y,player)
        player.speed(4)
        player_gravity.ground_collision
        player.draw
        player.move
        player.jump
        map.draw
        door.draw
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
        Window.draw_font(230,200,"GAME CLEAR",font, color:C_BLACK)
        if Input.key_push?(K_SPACE)
            state = 1 
            player.x = 25
        end

    when 3
        Window.draw_font(230,200,"GAME CLEAR",font,color:C_WHITE)
        if Input.key_push?(K_SPACE)
            state = 1
            player.x = 25
        end
    end
end