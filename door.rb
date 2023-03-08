require_relative "player"
class Door
    def initialize(x,y,x2,y2,player)
        @x = x
        @y = y
        @x2 = x2
        @y2 = y2
        @player = player
    end

    def teleport
        if @player === self
            @player.x = @x2
            @player.y = @y2
        end
    end

    def draw
        closed_door = Image.load("images/closed_door.png")
        Window.draw(@x,@y,closed_door)
    end
end