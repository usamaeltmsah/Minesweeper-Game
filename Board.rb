require_relative 'Tile.rb'

class Board
    attr_reader :grid, :size
    def initialize(size, bombs_num)
        @size = size
        @bombs_num = bombs_num
        @grid = generate_board
        plant_bombs
    end

    def generate_board
        Array.new(size) do |row|
            Array.new(size) { |col| Tile.new(self, [row, col]) }
        end
    end

    def [](pos)
        row, col = pos
        grid[row][col]
    end

    def won?
        @grid.flatten.all? { |tile| tile.explored? != tile.bombed? }
    end

    def lost?
        @grid.flatten.any? { |tile| tile.explored? && tile.bombed? }
    end

    def render(reveal=false)
        # Reveal the board at the end
        @grid.each do |row|
            row.each do |tile|
               print " #{reveal ? tile.reveal : tile.render} ".colorize(:black).on_white
            end
            puts
        end
        nil
    end

    def reveal
        render(true)
    end

    def plant_bombs
        cur_bombs = 0
        while cur_bombs < @bombs_num
            pos = rand_pos
            tile = self[pos]
            next if tile.bombed?
            tile.plant_bomb
            cur_bombs += 1
        end
    end

    def rand_pos
        [rand(size), rand(size)]
    end
end