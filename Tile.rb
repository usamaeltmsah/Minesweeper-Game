class Tile
    attr_accessor :neighbor_bomb_count
    def initialize(value)
        @value = value
        @neighbor_bomb_count = 0
        @state = 0 # Not revealed
    end

    def bombed?
        # Bombed if value is -1
        value == -1
    end
end