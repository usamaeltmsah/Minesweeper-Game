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

    def make_move(action, pos)
        tile = @board[pos]
        p action
        case action
        when "f"
            tile.toggle_flag
        when "e"
            tile.explore
        end
    end

    def get_pos
        pos = nil
        until valid_pos?(pos)
            pos = gets.chomp.split
            pos = [pos[0].to_i, pos[1].to_i]
        end
        pos
    end

    def valid_pos?(pos)
        return false if pos.nil?
        pos.all? { |cord| cord.between?(0, @board.size) }
    end

    def get_action
        action = nil
        action = gets.chomp until valid_action?(action)
        action
    end

    def valid_action?(action)
        return false if action.nil?
        actions = ['f', 'e']
        actions.include?(action)
    end
end