require_relative 'Board.rb'

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

    def play
        until @board.won? || @board.lost?
            puts @board.render
            print "Enter position ex. `1 2` > "
            pos = get_pos
            print "Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag > "
            action = get_action
            make_move(action, pos)
        end

        if @board.won?
            puts "You win!"
        elsif @board.lost?
            puts "**LOSER!**"
            puts @board.reveal
        end
    end
end