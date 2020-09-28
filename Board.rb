require_relative 'Tile.rb'

class Board
    attr_reader :board, :size
    def initialize(size, bombs_ratio)
        @size = size
        @board = rand_board(bombs_ratio)
    end

    def rand_board(bombs_ratio)
        Array.new(size) do |row|
            Array.new(size) { |col| Tile.new(self, [row, col]) }
        end
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end
end