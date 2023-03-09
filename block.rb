class Block < Sprite
    attr_accessor :dy,:v
    def initialize(player)
        
        @block_width = 80
        @block_height = 80
        self.image = Image.new(@block_width,@block_height,[100,0,0,0])
        self.collision = [0, 0, @block_width - 1, @block_height - 1]
        self.x = 200
        self.y = 200 - self.image.height
        @dy = 0
        @v = 0
        @player = player
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
            

        
          
