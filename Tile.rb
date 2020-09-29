require 'colorize'

class Tile
    CORDS = [
        [0, 1],
        [1, 0],
        [1, 1],
        [-1, -1],
        [0, -1],
        [-1, 0],
        [1, -1],
        [-1, 1]
    ]

    FLAG = "\u{1F6A9}"
    BOMB = "\u{1F4A3}"
    attr_reader :value
    def initialize(board, pos)
        @board = board
        @pos = pos
        @bombed = false
        @flagged = false
        @explored = false
    end

    def bombed?
        @bombed
    end

    def explored?
        @explored
    end

    def plant_bomb
        @bombed = true
    end

    def explore
        # don't explore flaged tile
        return self if flagged?

        # don't explore an explored tile
        return self if explored?

        @explored = true
        if !bombed? && have_no_neighbor_bombs?
            neighbors.each(&:explore)
        end
        self
    end

    def neighbors_bomb_count
        neighbors.select(&:bombed?).count
    end

    def have_no_neighbor_bombs?
        neighbors_bomb_count == 0
    end

    def flagged?
        @flagged
    end

    def toggle_flag
        # Can't flag explored tiles
        @flagged = !@flagged if !@explored
    end

    def valid_tile_pos?(tile_pos)
        tile_pos.all? { |cord| cord.between?(0, @board.size-1) }
    end

    def neighbors
        row, col = @pos
        neighbors = CORDS.map { |cord| [row + cord[0], col + cord[1]] }
        neighbors = neighbors.select { |pos| valid_tile_pos?(pos) }
        neighbors.map { |pos| @board[pos] }
    end

    def render
        if flagged?
            FLAG
        elsif explored?
            have_no_neighbor_bombs? ? "_" : neighbors_bomb_count.to_s
        else
            "*"
        end
    end

    def reveal
        # used to fully reveal the board at game end
        if flagged?
            # mark true and false flags
            bombed? ? FLAG : "f"
        elsif bombed?
            # display a hit bomb as an X
            explored? ? "X".colorize(:red) : BOMB
        else
            have_no_neighbor_bombs? ? "_" : neighbors_bomb_count.to_s
        end
    end
end