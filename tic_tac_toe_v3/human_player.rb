# require_relative "game"

class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        legalChoice = false
        while !legalChoice
            print "Submit position, enter as two numbers seperated by a space: "
            input = gets.chomp
            arr = input.split(" ").map{|val| val.to_i}
            if arr.length != 2 || !legal_positions.include?(arr)
                puts "Incorrect input, enter again"
                legalChoice = false
            else
                legalChoice = true
                return arr.map{|val| val.to_i }
            end
        end
    end
end