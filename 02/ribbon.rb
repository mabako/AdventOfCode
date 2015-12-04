input = IO.readlines("input.txt")

def dimensions(line)
  line.split("x").map(&:to_i)
end

def calculate_ribbon(line)
  dim = dimensions(line).sort

  present = dim.take(2).map { |num| num * 2 }.reduce(:+)
  bow = dim.reduce(:*)

  present + bow
end

total = input.map { |line| calculate_ribbon(line) }.reduce(:+)
puts "Total amount of ribbon required: #{total}"
