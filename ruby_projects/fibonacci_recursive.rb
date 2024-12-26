def fibb_recursive(n)
  if n<2
    return n
  else
   return (fibb_recursive(n-1) + fibb_recursive(n-2))
  end
end

puts fibb_recursive(9)