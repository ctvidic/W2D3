require_relative  "board"
require_relative  "human_player"
require_relative  "computer_player"

class Game
    def initialize(board_size, hash)
        @hash = hash
        @mark_values = @hash.keys
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
            if @hash[@current_player] == false
                player = HumanPlayer.new(@current_player)
            else
                player  = ComputerPlayer.new(@current_player)
            end
            @board.print
            @board.place_mark(player.get_position(@board.legal_positions),@current_player)
            if @board.win?(player.mark)
                puts "Victory for: " + @current_player.to_s
                return
            else
                self.switch_turn
            end
        end
        puts "Draw"
    end


end