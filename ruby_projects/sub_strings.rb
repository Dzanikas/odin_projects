def substring (dictionary, string)
  hash = {}
  arr = string.split(", ")
  puts arr
  dictionary.each do |word|
    if arr.include?(word.downcase)
      hash[word] = 0
      hash[word] += 1
    end
  end
  hash
end

dict = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
puts substring(dict, "down, below, jolly, howdy ho!")