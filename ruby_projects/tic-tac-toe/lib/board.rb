class Board

  @@board = [
    ["|", " ", "|", " ", "|", " ", "|"],
    ["-------------"],
    ["|", " ", "|", " ", "|", " ", "|"],
    ["-------------"],
    ["|", " ", "|", " ", "|", " ", "|"],
  ]

  def self.draw
    @@board.each {|row| puts row.join(" ")}
  end

  def self.put_mark(input, mark)
    row = (input - 1) / 3 * 2
    col = ((input - 1) % 3) * 2 + 1
    if @@board[row][col] == " "
      @@board[row][col] = mark.to_s
    else
      puts "Invalid move! Cell already taken."
    end
  end

  def self.extract_playable_fields
    @@board.select {|row| row.is_a?(Array) && row.include?("|")}
         .map {|row| row.values_at(1, 3, 5)}
  end

  def self.winner?
    normalized_board = self.extract_playable_fields

    normalized_board.each do |row|
      return true if row.uniq.size == 1 && row.first != " "
    end

    (0..2).each do |col|
      column = [normalized_board[0][col], normalized_board[1][col], normalized_board[2][col]]
      return true if column.uniq.size == 1 && column.first != " "
    end

    diagonal1 = [normalized_board[0][0], normalized_board[1][1], normalized_board[2][2]]
    diagonal2 = [normalized_board[0][2], normalized_board[1][1], normalized_board[2][0]]
    return true if diagonal1.uniq.size == 1 && diagonal1.first != " "
    return true if diagonal2.uniq.size == 1 && diagonal2.first != " "
  
    false
  end

  def self.draw?
    normalized_board = self.extract_playable_fields
    
    all_filled = normalized_board.flatten.none? { |cell| cell == " " }
    
    all_filled && !self.winner?
  end

  def self.reset_board
    @@board = [
    ["|", " ", "|", " ", "|", " ", "|"],
    ["-------------"],
    ["|", " ", "|", " ", "|", " ", "|"],
    ["-------------"],
    ["|", " ", "|", " ", "|", " ", "|"]
  ]
  end
end