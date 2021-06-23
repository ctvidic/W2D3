class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def self.valid_pegs?(array)
    array.all?{|char| POSSIBLE_PEGS.has_key?(char.upcase)}
  end

  def initialize(array)
      if !Code.valid_pegs?(array)
        raise
      else  
        @pegs = array
        array.map!{|char| char.upcase}
      end
  end

  def pegs
    @pegs
  end
  
  def self.random(length)
      array = Array.new(length)
      (0..length-1).each do |i|
        array[i] = POSSIBLE_PEGS.keys.sample
      end
      Code.new(array)
  end

  def self.from_string(pegs)
      arr = []
      pegs.each_char do |char|
        if POSSIBLE_PEGS.has_key?(char.upcase)
          arr << char
        end
      end
      Code.new(arr)
  end

  def [](idx)
      @pegs[idx]
  end

  def length
      @pegs.length
  end

  def num_exact_matches(guess)
      count = 0
      guess.pegs.each_with_index do |peg, i|
        if  @pegs[i] == peg
          count+=1
        end
      end
      return count 
  end

  def num_near_matches(guess)
    double = false
    count = 0
    arr= []
    newArr = []
    guess.pegs.each_with_index do |val, i|
        if val != self[i] 
            arr << self[i]
            newArr << val
        elsif val == self[i]
            arr << ""
        end
    end
    newArr.each do |val2|
        if arr.include?(val2)
            count += 1
            arr.delete(val2)
        end
    end
    return count 
  end

  def ==(arg)
    arg.pegs.each_with_index do |val, i|
      if self[i] != val
        return false 
      end
    end
    return true
  end
end
