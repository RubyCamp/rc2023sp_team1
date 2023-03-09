class Start
    def initialize
        @charactor = Image.load("images/hito_right.png")
        @cloud = Image.load("images/cloud.png")
        @font = Font.new(32,"Bhanschrift")
        @font2 = Font.new(24,"Bhanschrift")
    end
    
    def draw
        Window.draw(275,175,@charactor)
        Window.draw_font(230,230,"Block Boy",@font)
        Window.draw_font(200,270,"Press space to start",@font2)
    end
end
