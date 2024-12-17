class Turn
  attr_reader :array

  def initialize(input)
    @array = []
    input.each {|i| @array << i}
  end

  def check
    Mastermind.correct_guess = 0
    Mastermind.close_guess = 0

    @array.each_with_index do |color, i|
      if color == Board.code[i]
        Mastermind.correct_guess += 1
      elsif Board::AVAILABLE_COLORS.include?(color) #might return a false positive when you guessed the same color twice but in the code is only once
        Mastermind.close_guess += 1
      end
    end
  end

end