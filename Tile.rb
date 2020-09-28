class Tile
    def initialize(value)
        @value = value
        @neighbor_bomb_count = 0
        @state = 0 # Not revealed
    end
end