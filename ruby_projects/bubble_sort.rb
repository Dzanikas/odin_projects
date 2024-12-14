class Array
  def swap!(a, b)
    self[a], self[b] = self[b], self[a]
    self
  end
end

def bubble_sort (array)
  n = array.length
  loop do
    swapped = false
      (1...n).each do |i|
      if array[i-1] > array[i]
        array.swap!(i-1, i)
        swapped = true
      end
    end
  break unless swapped
  end
  array
end

puts bubble_sort([4,3,78,2,0,2])