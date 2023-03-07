class Player < Sprite
    def initialize
        @right_image = Image.load("images/hito_right.png")
        @left_image = Image.load("images/hito_left.png")
        self.image = @right_image
        self.x = 200
        self.y = 300 - self.image.height
        @dx = 0
        @speed = 4
    end

    def fall
        self.y += 2
    end

    def move
        self.x += @dx
        @dx = 0
        @dx = @speed if Input.key_down?(K_D)
        @dx = -@speed if Input.key_down?(K_A)

        if @dx > 0
            self.image = @right_image
        elsif @dx < 0
            self.image = @left_image
        end
    end
end
