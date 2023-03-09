require "csv"
require_relative "door"
require_relative "block"
require_relative "player"
require_relative "gravity"

class Map
    attr_accessor :map, :block, :move_blocks
    def initialize(map)
        @dat_path = "maps/stage#{map}.map"
        get_data
        @move_blocks = []
        @block = Image.new(20, 20, [139,69,19])
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
            end
        end
        move_block
    end

    def create_move_block
        
        for i in 0..19
            for j in 0..29
                a = @map[i][j]
                case a
                when 6
                    @move_blocks << Block.new(j * 20, i * 20, 0)
                when 7
                    @move_blocks << Block.new(j * 20, i * 20, 1)
                when 8
                    @move_blocks << Block.new(j * 20, i * 20, 2)
                when 9
                    @move_blocks << Block.new(j * 20, i * 20, 3)
                end
            end
        end
    end

    def move_block
        for i in 0..3
            block_x = (@move_blocks[i].x / 20)
            block_y = ((@move_blocks[i].y + 80) / 20)
            block_gravity = Gravity.new(block_x,block_y,@move_blocks[i])
            block_gravity.fall
            @move_blocks[i].draw
        end
    end
end