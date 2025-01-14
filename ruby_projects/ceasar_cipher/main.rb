class Cipher

def code(string, shift = 0)
  string.downcase.chars.map do |i|
    ((i.ord - 'a'.ord + shift.to_i) % 26 + 'a'.ord).chr
  end.join
end

end
