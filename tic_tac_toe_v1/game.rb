require_relative  "board"
require_relative  "human_player"

class Game
    def initialize(player_1_mark, player_2_mark)
        @player_1_mark = HumanPlayer.new(player_1_mark)
        @player_2_mark = HumanPlayer.new(player_2_mark)
        @board = Board.new
        @current_player = @player_1_mark
    end

    def switch_turn
        if @current_player == @player_1_mark
            @current_player = @player_2_mark
        else
            @current_player = @player_1_mark
        end
    end
    
    def play
        while @board.empty_positions?
            @board.print
            @board.place_mark(@current_player.get_position,@current_player.mark)
            if @board.win?(@current_player.mark)
                puts "Victory for: " + @player_1_mark.mark.to_s
                return
            else
                self.switch_turn
            end
        end
        puts "Draw"
    end


end