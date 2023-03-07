class Map
    def initialize
        @x = 0
        @y = 300
        @image = Image.new(600,100,C_BLACK)
    end
    def draw
        Window.draw(@x,@y,@image)
    end
end