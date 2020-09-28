require_relative 'Tile.rb'

class Board
    def initialize
        @board = rand_board
    end

    def rand_board
        Array.new(9) {Array.new(9) {Tile.rand_tile}}
    end
end