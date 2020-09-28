class Tile
    attr_accessor :neighbor_bomb_count
    attr_reader :neighbors, :value
    def initialize(value)
        @value = value # Bomb or empty
        @neighbor_bomb_count = 0
        @revealed = false
        @flagged = false
        @neighbors = []
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end

    def self.rand_tile
        # -1 => bomb, 0 => Empty
        rand(-1, 0)
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