require 'json'

class Hangman
  attr_accessor :code, :fields, :input_guess, :arr_guess, :tries_left

  @@dictionary = File.readlines('google-10000-english-no-swears.txt')

  def initialize
    @code = []
    @fields = []
    @input_guess = []
    @arr_guess = []
    @tries_left = 10
  end

  def create_code(dictionary)
    loop do
      @code = dictionary.sample.strip.chars
      if @code.length() > 5 && @code.length < 10
        return @code
      end
    end
  end

  def initiate_fields
    @fields = Array.new(@code.length(), "_")
  end

  def make_guess
    loop do
      print "Enter a letter: "
      @input_guess = gets.chomp.downcase
      if @input_guess.match?(/\A[a-z]\z/)
        @arr_guess << @input_guess
        break
      else
        puts "Invalid input. Enter a single letter."
      end
    end
    @guess
  end

  def check
    if @code.include?(@input_guess)
      i = @code.find_index("#{@input_guess}")
      @fields[i] = "#{@input_guess}"
    else
      @tries_left -= 1
    end
  end

  def win?
    @fields == @code
  end

  def draw
    puts "Hangman: #{@fields.join("")} | Guesses left: #{@tries_left}"
    puts "Letters used: #{@arr_guess.join("")}"
  end

  def save_game
    game_state = {
      code: @code,
      fields: @fields,
      input_guess: @input_guess,
      arr_guess: @arr_guess,
      tries_left: @tries_left
    }

    File.open("hangman_savegame.json", "w") do |file|
      file.write(JSON.pretty_generate(game_state))
    end
    puts "Game saved successfully!"
  end

  def self.load_game
    if File.exist?("hangman_savegame.json")
      data = JSON.parse(File.read("hangman_savegame.json"))
      game = Hangman.new
      data.each { |key, value| game.instance_variable_set("@#{key}", value) }
      puts "Game loaded successfully!"
      return game
    else
      puts "No saved game found."
      return nil
    end
  end

  def play_game
    
    loop do
      make_guess
      check
      draw

      if win?
        puts "You won!"
      elsif @tries_left == 0
        puts "You lost! The code was #{@code}"
      end

      loop do
        puts "Do you want to continue [C] or save the game and quit [S]?"
        choice = gets.chomp.to_s.upcase
        if choice == "C"
          break
        elsif choice == "S"
          save_game
          exit
        else
          puts "Invalid input. Try again."
        end
      end

    end
  end

  def self.play
    
    puts "Press S to start a new game or press L to load the previous game: "
    choice = gets.chomp.to_s.upcase
    if choice == "S"
      game = Hangman.new
      game.create_code(@@dictionary)
      game.initiate_fields
    elsif choice == "L"
      game = Hangman.load_game
    else
      puts "Invalid input. Try again."
    end

    game.play_game

  end

end

Hangman.play