input = IO.readlines('input.txt')

def dimensions(line)
  line.split('x').map(&:to_i)
end

def calculate_wrapping(line)
  length, width, height = dimensions(line)
  # calculate sums for each individual side
  sums = [ length * width, width * height, height * length ]

  # two identical sides each, plus overhead in terms of the smallest side
  2 * sums.reduce(:+) + sums.min
end

# calculate total wrapping
total = input.map { |line| calculate_wrapping(line) }.reduce(:+)
puts "Total amount of wrapping paper used: #{total}"
