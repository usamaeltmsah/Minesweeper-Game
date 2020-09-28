class Tile
    attr_reader :neighbors, :value
    def initialize(value)
        @value = value # -1 => bomb, 0 => Empty
        @revealed = false
        @flagged = false
        @neighbors = []
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end

    def neighbor_bomb_count
        neighbors.select(&:bombed?).count
    end

    def self.rand_tile(bombs_ratio)
        raise "Not vlid bombs ratio [0.1 ... 0.8]" if !bombs_ratio.between?(0.1..0.8)
        val = rand < bombs_ratio ? 0 : -1 # 80% for empty and 20% for bombs
        self.new(val)
    end

    def flagged?
        self.flagged
    end

    def flag
        self.flagged = true
    end

    def unflag
        self.flagged = false
    end
    
    def revealed?
        self.revealed
    end

    def reveal
        self.revealed = true
    end

    def add_neighbor(tile_val)
        @neighbors << tile_val
    end

    private
    attr_writer :neighbors
end