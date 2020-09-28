require_relative 'Tile.rb'

class Board
    attr_reader :board, :size
    def initialize(size, bombs_ratio)
        @size = size
        @board = rand_board(bombs_ratio)
    end

    def rand_board(bombs_ratio)
        Array.new(size) {Array.new(size) {Tile.rand_tile(bombs_ratio)}}
    end

    def [](pos)
        row, col = pos
        board[row][col]
    end

    def add_neighbors_for_Each_tile
        (0...size).each do |row|
            (0...size).each do |col|
                pos = [row, col]
                tile = self[pos]
                nrighbors = [[row, col+1], [row+1, col], [row+1, col+1], [row, col-1], [row+1, col-1], [row-1, col], [row-1, col+1], [row-1, col-1]]
                tile.add_neighbors(nrighbors)
            end
        end
    end
end