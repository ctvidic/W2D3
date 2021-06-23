# require_relative "human_player"

class Board
    def initialize(n)
        @grid = Array.new(n, "_"){Array.new(n, "_")}
    end

    def grid
        @grid
    end

    def valid(position)
        position.each do |val|
            if val > @grid.length - 1 || val < 0
                return false
            end
        end
        return true
    end

    def empty?(position)
        if @grid[position[0]][position[1]] == "_"
            return true
        else
            return false
        end
    end

    def place_mark(position, mark)
        if !self.empty?(position) || !self.valid(position)
            raise "invalid mark"
        else
            @grid[position[0]][position[1]] = mark
        end
    end

    def print
        @grid.each do |subarray|
            puts subarray.join(" ")   
        end
    end

    def win_row?(mark)
        @grid.each do |subarray|
            if subarray.all?{|val| val == mark}
                return true
            end
        end
        return false
    end

    def win_col?(mark)
        transpose = @grid.transpose
        transpose.each do |subarray|
            if subarray.all?{|val| val == mark}
                return true
            end
        end
        return false
    end

    def win_diagonal?(mark)
        diag = []
        @grid.each_with_index do |row, x|
            row.each_with_index do |val, y|
                if x == y
                    diag << val
                end
            end
        end
        if diag.all?{|val| val == mark}
            return true
        end
        diag = []
        reverseGrid = @grid.reverse
        reverseGrid.each_with_index do |row, x|
            row.each_with_index do |val, y|
                if x == y
                    diag << val
                end
            end
        end
        if diag.all?{|val| val == mark}
            return true
        end
        return false
    end

    def win?(mark)
        if self.win_diagonal?(mark) || self.win_col?(mark) || self.win_row?(mark)
            return true
        else
            return false
        end
    end

    def empty_positions?
        oneD = @grid.flatten
        if oneD.any?{|val| val == "_"}
            return true
        else
            return false
        end   
    end
end