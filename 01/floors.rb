input = IO.read("input.txt")

puts "You are now on floor #{input.count("(") - input.count(")")}"
