require_relative "code"

class Mastermind
    POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
    }
    def initialize(length)
        @secret_code = Code.random(length)
    end

    def print_matches(arg)
        print arg.num_exact_matches(@secret_code)
        print arg.num_near_matches(@secret_code)
    end

    def ask_user_for_guess
        puts "Enter a code"
        input = gets.chomp
        arr = Code.from_string(input)
        self.print_matches(arr)
        return arr == @secret_code
    end
end
