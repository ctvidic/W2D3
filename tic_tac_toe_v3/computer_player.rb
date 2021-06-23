
class ComputerPlayer
    def initialize(mark)
        @mark = mark
    end

    def mark
        @mark
    end

    def get_position(legal_positions)
        x = legal_positions.sample
        puts "Computer chose: " + x.to_s
        return x
    end
end