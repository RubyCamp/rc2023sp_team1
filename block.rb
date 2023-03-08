class Block < Sprite
    def initialize(x,y)
        @block_width = 80
        @block_height = 80
        self.image = Image.new(@block_width,@block_height,[100,0,0,0])
        self.collision = [0, 0, @block_width - 1, @block_height - 1]
        self.x = x
        self.y = y
    end

    def move
        # ifで右から来たのと左から来たので分ける
        self.x += 30
    end

end