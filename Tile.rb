class Tile
    attr_accessor :neighbor_bomb_count, :state
    attr_reader :neighbors
    def initialize(value)
        @value = value
        @neighbor_bomb_count = 0
        @state = 0 # [0 => Not revealed, 1 => revealed, -1 => flagged]
        @neighbors = []
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end
    
    def flagged?
        state == -1
    end
    
    def revealed?
        state == 1
    end

    def reveal
        state = 1
    end

    def add_neighbour(tile_val)
        @neighbors << tile_val
    end

    private
    attr_writer :neighbors
end