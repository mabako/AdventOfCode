require 'matrix'

input = IO.readlines('input.txt')

controls = { 'turn on' => 1, 'turn off' => -1, 'toggle' => 2 }

grid = Matrix.zero(1000)
input.each { |str|
  str =~ /\A(.*)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/
  ($2.to_i..$4.to_i).each { |x|
    ($3.to_i..$5.to_i).each { |y|
      grid.send(:[]=, x, y, [0, grid[x, y] + controls[$1]].max)
    }
  }
}

puts grid.reduce(:+)
