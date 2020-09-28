class Tile
    FLAG = "\u{1F6A9}"
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

    def self.rand_tile(bombs_ratio)
        raise "Not vlid bombs ratio [0.1 ... 0.8]" if !bombs_ratio.between?(0.1, 0.8)
        val = rand < bombs_ratio ? 0 : -1 # 80% for empty and 20% for bombs
        self.new(val)
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
        neighbors = [[row, col+1], [row+1, col], [row+1, col+1], [row, col-1], [row+1, col-1], [row-1, col], [row-1, col+1], [row-1, col-1]]
        neighbors = neighbors.select { |pos| valid_tile_pos?(pos) }
        neighbors.map { |pos| @board[pos] }
    end

    def reveal
        # used to fully reveal the board at game end
        if flagged?
            # mark true and false flags
            bombed? ? FLAG : "f"
        elsif bombed?
            # display a hit bomb as an X
            explored? ? "X" : "B"
        else
            neighbors_bomb_count == 0 ? "_" : neighbors_bomb_count.to_s
        end
    end
end