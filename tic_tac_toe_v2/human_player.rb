# require_relative "game"

class HumanPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position
        print "Submit position, enter as two numbers seperated by a space: "
        input = gets.chomp
        arr = input.split(" ")
        if arr.length != 2
            raise "Incorrect input"
        else
            return arr.map{|val| val.to_i }
        end
    end
end