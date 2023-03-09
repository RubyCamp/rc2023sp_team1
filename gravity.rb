require_relative "map"
require_relative "player"
require_relative "block"

class Gravity
    def initialize(map_x,map_y,object)
        @map_x = map_x
        @map_y = map_y
        @map = Map.new(1)
        @object = object
        @player = Player.new
    end

    def fall
        line = @map.map_data[@map_y]
        if line[@map_x] == 0
            @object.y += 4
        end
    end

    def ground_collision
        @player.speed
        line = @map.map_data[@map_y-1]
        if line[@map_x+1] != 0
            @player.stop
        end

        if line[@map_x-1] != 0
            @player.stop
        end
    end
end