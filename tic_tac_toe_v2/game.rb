require_relative  "board"
require_relative  "human_player"

class Game
    def initialize(board_size, *mark_values)
        @mark_values = mark_values
        # @player_1_mark = HumanPlayer.new(player_1_mark)
        # @player_2_mark = HumanPlayer.new(player_2_mark)
        @board = Board.new(board_size)
        @current_player = @mark_values[0]
    end

    def switch_turn
        @mark_values.rotate!(1)
        @current_player = @mark_values[0]
    end
    
    def play
        while @board.empty_positions?
            humanPlayer = HumanPlayer.new(@current_player)
            @board.print
            @board.place_mark(humanPlayer.get_position,@current_player)
            if @board.win?(humanPlayer.mark)
                puts "Victory for: " + @current_player.to_s
                return
            else
                self.switch_turn
            end
        end
        puts "Draw"
    end


end