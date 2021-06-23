class Board
    def initialize(n)
        @grid = Array.new(n,:N){Array.new(n, :N)}
        @size = n*n
    end

    def size
        @size
    end

    def [](array)
       @grid[array[0]][array[1]]
    end

    def []=(position, value)
        @grid[position[0]][position[1]] = value
    end

    def num_ships
        sum = 0
        @grid.each do |subarray|
            sum += subarray.count(:S)
        end
        sum
    end

    def attack(position)
        if self.[](position) == :S
           puts "you sunk my battleship!"
           self.[]=(position, :H)
           return true
        else
            self.[]=(position, :X)
            return false
        end
    end

    def place_random_ships
        x = 0
        while self.num_ships < (self.size*0.25)
            self.[]=([rand(0...@grid.size),rand(0...@grid.size)],:S)
            x += 1
        end
    end

    def hidden_ships_grid
        newArr = Array.new(@grid.size){Array.new(@grid.size)}
        @grid.each_with_index do |subarray, i1|
            subarray.each_with_index do |val, i2|
                if val == :S
                    newArr[i1][i2] = :N
                else
                    newArr[i1][i2] = self.[]([i1,i2])
                end
            end
        end
        return newArr
    end

    def self.print_grid(array)
        array.each do |subarray|
            string = ""
            subarray.each do |char|
                string += char.to_s + " "
            end
            string = string[0..-2] + "\n"
            print string     
        end
    end

    def cheat
        Board.print_grid(@grid)
    end

    def print
        Board.print_grid(self.hidden_ships_grid)
    end        

end
