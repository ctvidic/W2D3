class Player
    def get_move
        print "enter a position with coordinates separated with a space like \'4 7\'"
        input = gets.chomp
        inputSplit = input.split(" ").map{|char| char.to_i}
        return inputSplit
    end
end
