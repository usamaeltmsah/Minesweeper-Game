class Tile
    attr_accessor :neighbor_bomb_count, :state
    def initialize(value)
        @value = value
        @neighbor_bomb_count = 0
        @state = 0 # [0 => Not revealed, 1 => revealed, -1 => flagged]
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end
    
    def flagged?
        state == -1
    end
end