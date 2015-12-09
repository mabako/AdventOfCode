input = IO.readlines('input.txt').map(&:chomp)
puts input.map { |str| str.length - eval(str).length }.reduce(:+)
puts input.map { |str| str.inspect.length - str.length }.reduce(:+)
