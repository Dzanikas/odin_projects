def cipher(string, shift)
  string.downcase.chars.map do |i|
    ((i.ord - 'a'.ord + shift.to_i) % 26 + 'a'.ord).chr
  end.join
end

puts cipher('ZORRO', 5)
