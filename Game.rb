require_relative 'Board.rb'
require 'yaml'

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
            system("clear")
            puts @board.render
            print "Enter an action ex. `e` -> Explore or `f` -> Flag/Unflag and `s` -> Save > "
            action = get_action
            save if action == 's'
            print "Enter position ex. `1 2` > "
            pos = get_pos
            make_move(action, pos)
        end
        
        if @board.won?
            puts "You win!".colorize(:green).on_white
        elsif @board.lost?
            puts @board.reveal
            puts "**LOSER!**".colorize(:red).on_white
        end
    end

    def make_move(action, pos)
        tile = @board[pos]
        case action
        when "f"
            tile.toggle_flag
        when "e"
            tile.explore
        end
    end

    def save
        print "Enter file name to save at: "
        file = gets.chomp

        File.write(file, YAML::dump(self))
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
        actions = ['f', 'e', 's']
        actions.include?(action)
    end

    if $PROGRAM_NAME == __FILE__
        case ARGV.count
        when 0
            Minesweeper.new(:s).play
        when 1
            YAML::load_file(ARGV.shift).play
        end
    end
end