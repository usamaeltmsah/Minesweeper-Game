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

    def valid_tile_pos?(tile_pos)
        tile_pos.all? { |cord| cord >= 0 }
    end

    def add_neighbors_for_Each_tile
        (0...size).each do |row|
            (0...size).each do |col|
                pos = [row, col]
                tile = self[pos]
                neighbors = [[row, col+1], [row+1, col], [row+1, col+1], [row, col-1], [row+1, col-1], [row-1, col], [row-1, col+1], [row-1, col-1]]
                neighbors = neighbors.select { |pos| valid_tile_pos?(pos) }
                # tile.add_neighbors(neighbors)
            end
        end
    end
end