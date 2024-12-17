require_relative "lib/board"

class Game

  @@current_player = "X"
  @@input = nil

  def self.gather_input
    loop do
      print "Player #{@@current_player}: enter a number from 1 to 9: "
      @@input = gets.chomp.to_i
      break if @@input.between?(1, 9)
      puts "Invalid value. Try again."
    end
  end

  def self.play_game
    Board.reset_board
    loop do
      Board.draw

      Game.gather_input
      Board.put_mark(@@input, @@current_player)
      
      if Board.winner?
        Board.draw
        puts "Player #{@@current_player} is the winner!"
        break
      elsif Board.draw?
        Board.draw
        puts "It's a draw!"
        break
      end

      @@current_player = @@current_player == "X" ? "O" : "X"
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

Game.play_game