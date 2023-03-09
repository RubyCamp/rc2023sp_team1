class Block < Sprite
    attr_accessor :dy,:v
    def initialize(x,y,num,player)
        @block_width = 80
        @block_height = 80
        self.image = Image.load_tiles("images/puzzle1.png", 2, 2)[num]
        self.collision = [0, 0, @block_width - 1, @block_height - 1]
        self.x = x
        self.y = y
        @dy = 0
        @v = 0
        @block_speed = 10
    end

    def move
        if @player.x + @player.image.width < self.x + 80
            self.x += @block_speed
            @player.x = self.x - @player.image.width - 1
        elsif @player.x + @player.image.width > self.x
            self.x -= @block_speed
            @player.x = self.x + 80 + 1
        end
        #p "bbbb"
    end
      
end
            

        
          
