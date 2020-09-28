require_relative 'Tile.rb'

class Board
    attr_reader :board, :size
    def initialize(size, bombs_ratio)
        @board = rand_board(bombs_ratio)
        @size = size
    end

    def rand_board
        Array.new(9) {Array.new(9) {Tile.rand_tile}}
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end
end