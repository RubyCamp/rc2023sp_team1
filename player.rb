require_relative "map"

class Player < Sprite
    attr_accessor :dy, :v
    def initialize
        @right_image = Image.load("images/hito_right.png")
        @left_image = Image.load("images/hito_left.png")
        self.image = @right_image
        self.x = 0
        self.y = 200 - self.image.height
        @bottom = y + self.image.height
        self.collision = [0, 0, self.image.height - 1, self.image.width - 1]
        @dx = 0
        @dy = 0
        @v = 0
        @speed = 4
        @space_count = 0
        @jump_count = 3
        @map_x = (self.x / 20).abs
        @map_y = ((self.y + 50) / 20).abs
        @map = Map.new
    end

    def move
        self.x += @dx
        @dx = 0
        @dx = @speed if Input.key_down?(K_D)
        @dx = -@speed if Input.key_down?(K_A)
        
        self.y -= @dy
        @dy = 0
        
        if @dx > 0
            self.image = @right_image
        elsif @dx < 0
            self.image = @left_image
        end
    end

    def push 
    end

    def jump
        line = @map.map_data[@map_y]
        line2 = @map.map_data[@map_y+1]
        if @space_count < 3
            if Input.key_push?(K_SPACE)
                @v = -10
                @space_count += 1
            end
        end
        @bottom += @v
        # ここの条件をかえる
        # もしも下のブロックが1の時spaceを0にしたい
        # if (@bottom >= 191)
        #     @bottom = 190
        #     @v = 0
        #     @space_count = 0
        # end
        # if (@bottom >= @map_y*20)
        #     @bottom = @map_y*20
        #     @v = 0
        #     @space_count = 0
            
        # end
        p @space_count
        if line2[@map_x] == 1
            @bottom = @map_y
            @v = 0
            @space_count = 0
        end
        # if line[@map_x] == 1
        #     @space_count = 0
        # end
        # self.y = @bottom - 32
        self.y = @bottom - self.image.height
        @v += 1 # 重力加速度
        
    end
end