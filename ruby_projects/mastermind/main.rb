require_relative "lib/board"
require_relative "lib/turn"
require 'pry-byebug'

class Mastermind
  @@turn_no = 0
  @@correct_guess = 0
  @@close_guess = 0
  # turn = nil
  def self.turn_no
    @@turn_no
  end

  def self.correct_guess
    @@correct_guess
  end

  def self.close_guess
    @@close_guess
  end

  def self.correct_guess=(value)
    @@correct_guess = value
  end

  def self.close_guess=(value)
    @@close_guess = value
  end

  def self.gather_input
    loop do
      print "Enter a combination of 4 colors and separate them by '/' e.g. (B/G/R/Y): "
      @@input = gets.chomp.upcase.split("/")
      if @@input.all? { |color| Board::AVAILABLE_COLORS.include?(color) } && @@input.length == 4
        break
      else
        puts "Invalid input. Try again."
      end
    end
  end

  def self.play
    Board.reset_board
    Board.create_code

    loop do
      @@turn_no += 1
      Mastermind.gather_input
      turn = Turn.new(@@input)
      turn.check
      Board.add_turn(turn)
      Board.draw

      if @@correct_guess == 4
        puts "Win!"
        break
      elsif @@turn_no == 12
        puts "You lost!"
        break
      end
    end

    print "Press R to restart, or any other key to quit"
    decision = gets.chomp.to_s.upcase
    if decision == "R"
      self.play_game
    else
      puts "Thanks for playing!"
    end

  end
end

Mastermind.play