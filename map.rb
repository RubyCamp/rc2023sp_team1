require "csv"
require_relative "door"
require_relative "block"
require_relative "player"
require_relative "gravity"

class Map
    def initialize(map)
        @dat_path = "maps/stage#{map}.map"
        get_data
        @block = Image.new(20, 20, C_BLACK)
    end

    def get_data
        @map = []
		CSV.foreach(@dat_path) do |row|
            @map << row.map(&:to_i)
        end
	end

    def map_data
        @map
    end

    def block
        Image.new(20, 20, C_BLACK)
    end
 
    def draw
        for i in 0..19
            for j in 0..29
                Window.draw(j * 20, i * 20, @block) if @map[i][j] == 1
                a = @map[i][j]
                case a
                when 6
                    @move_block = Block.new(j * 20, i * 20, 0)
                    @move_block.draw
                when 7
                    @move_block = Block.new(j * 20, i * 20, 1)
                    @move_block.draw
                when 8
                    @move_block = Block.new(j * 20, i * 20, 2)
                    @move_block.draw
                when 9
                    @move_block = Block.new(j * 20, i * 20, 3)
                    @move_block.draw
                end
            end
        end
    end

    def move_block
        @move_block
    end
end