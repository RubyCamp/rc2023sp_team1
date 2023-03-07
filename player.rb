class Player < Sprite
    def initialize
        self.image = Image.new(30,60,C_BLUE)
        self.x = 200
        self.y = 300 - self.image.height
    end

    def fall
        self.y += 2
    end

    def move
        self.x += 2 if Input.key_down?(K_D)
        self.x -= 2 if Input.key_down?(K_A)
    end
end