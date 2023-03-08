require_relative "map"
require_relative "player"
require_relative "block"

class Gravity
    def initialize(map_x,map_y,object)
        @map_x = map_x
        @map_y = map_y
        @map = Map.new(1)
        @object = object
    end

    def fall
        line = @map.map_data[@map_y]
        if line[@map_x] == 0
            @object.y += 4
        end
    end   
end