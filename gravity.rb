require_relative "map"
require_relative "player"

class Gravity
    def initialize(map_x,map_y,object)
        @map_x = map_x
        @map_y = map_y
        @map = Map.new
        @object = object
    end
    def fall
        line = @map.map_data[@map_y]
        if line[@map_x] == 0
            @object.y += 2
        # elsif line[@map_x] == 1
        #     @object.v = -10
        end
    end
end