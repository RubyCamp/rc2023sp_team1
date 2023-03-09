class Design
    def initialize
    end

    def cloud(x,y)
        image = Image.load("images/cloud.png")
        Window.draw(x,y,image)
    end
end