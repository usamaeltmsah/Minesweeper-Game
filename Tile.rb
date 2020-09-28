class Tile
    FLAG = "\u{1F6A9}"
    attr_reader :neighbors, :value
    def initialize(value)
        @value = value # -1 => bomb, 0 => Empty
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

    private
    attr_writer :neighbors
end