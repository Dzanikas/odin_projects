class Board
  @@code = []
  @@board = []

  AVAILABLE_COLORS = ["B", "G", "R", "Y"]

  def self.create_code
    4.times do |x|
      x = AVAILABLE_COLORS.sample
      @@code << x
    end
  end

  def self.code
    @@code
  end
  
  def self.add_turn(turn)
    arr = turn.array
    formatted_turn = arr.unshift("Turn #{Mastermind.turn_no}: ")
                        .push("Correct guesses: #{Mastermind.correct_guess} | Close guesses: #{Mastermind.close_guess}")
                        .join(" ")
    @@board << formatted_turn
  end
  
  def self.draw
    puts "Game Board:"
    puts "-" * 50
    @@board.each do |arr|
      puts arr
      puts "-" * 50
    end
  end

  def self.reset_board
    @@board = []
  end

end