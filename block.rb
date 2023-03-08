class Block < Sprite
    def initialize(x,y,num)
        @block_width = 80
        @block_height = 80
        self.image = Image.load_tiles("images/puzzle1.png", 2, 2)[num]
        self.collision = [0, 0, @block_width - 1, @block_height - 1]
        self.x = x
        self.y = y
    end

    def move
        # ifで右から来たのと左から来たので分ける
        self.x += 30
    end

end