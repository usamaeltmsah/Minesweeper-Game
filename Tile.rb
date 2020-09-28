class Tile
    FLAG = "\u{1F6A9}"
    attr_reader :neighbors, :value
    def initialize(board, pos)
        @board = board
        @pos = pos
        @revealed = false
        @flagged = false
        @explored = false
        @neighbors = []
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end

    def explored?
        @explored
    end

    def neighbors_bomb_count
        neighbors.select(&:bombed?).count
    end

    def self.rand_tile(bombs_ratio)
        raise "Not vlid bombs ratio [0.1 ... 0.8]" if !bombs_ratio.between?(0.1, 0.8)
        val = rand < bombs_ratio ? 0 : -1 # 80% for empty and 20% for bombs
        self.new(val)
    end

    def flagged?
        @flagged
    end

    def flag
        @flagged = true
    end

    def unflag
        @flagged = false
    end
    
    def revealed?
        @revealed
    end

    def reveal
        @revealed = true
    end

    def add_neighbors(tiles)
        tiles.each { |tile_pos| @neighbors << tile_pos }
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

    private
    attr_writer :neighbors
end