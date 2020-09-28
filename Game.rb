class Minesweeper
    LAYOUTS = {
        s: { size: 9, num_bombs: 10 },
        m: { size: 16, num_bombs: 40 },
        l: { size: 32, num_bombs: 160 }
    }
    def initialize(size)
        layout = LAYOUTS[size]
        @board = Board.new(layout[:size], layout[:num_bombs])
    end
end