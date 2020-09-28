require_relative 'Tile.rb'

class Board
    attr_reader :grid, :size
    def initialize(size, bombs_ratio)
        @size = size
        @grid = rand_board(bombs_ratio)
    end

    def rand_board(bombs_ratio)
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
end