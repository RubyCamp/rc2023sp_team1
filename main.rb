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
state = 0
font = Font.new(32)
block = Block.new
timeout_seconds = 5


Window.loop do
    case state
    when 0
        start_image = Image.load("start_image.png")
        Window.draw(0,0,start_image)
        state = 1 if Input.key_push?(K_SPACE)

        
    when 1
        map_x = (player.x / 20).abs
        map_y = ((player.y + 50) / 20).abs
        #block_x = (block.x / 20).abs
        #block_y = ((block.y + 80) / 20).abs
        player_gravity = Gravity.new(map_x,map_y,player)
        #block_gravity = Gravity.new(block_x,block_y,block)
        player.draw
        player.move
        map.draw
        door.draw
        block.draw
        player_gravity.fall
        #block_gravity.fall
        #arr = [player,block]
        #if Sprite.check(arr) then
            player.push
            #block.move
        #end
        
        state = 2 if player.x >= 580
        puts player.x

    when 2
        Window.draw_font(230,200,"GAME CLEAR",font,color:C_BLACK)
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