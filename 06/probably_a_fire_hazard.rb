require 'benchmark'
require 'matrix'

@input = IO.readlines('input.txt')

def with_hash
  grid = Hash.new(false)
  @input.each { |str|
    str =~ /\A(.*)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/
    ($2..$4).each { |x|
      ($3..$5).each { |y|
        grid[[x, y]] =
          case $1
          when 'turn on' then true
          when 'turn off' then false
          when 'toggle' then !grid[[x, y]]
          end
      }
    }
  }

  grid.count{ |_, x| x }
end

def with_matrix
  grid = Matrix.zero(1000)
  @input.each { |str|
    str =~ /\A(.*)\s(\d+),(\d+)\sthrough\s(\d+),(\d+)/
    ($2..$4).each { |x|
      ($3..$5).each { |y|
        grid.send(:[]=, x.to_i, y.to_i,
          case $1
          when 'turn on' then 1
          when 'turn off' then 0
          when 'toggle' then 1 - grid[x.to_i, y.to_i]
          end
        )
      }
    }
  }

  puts grid.reduce(:+)
end

puts Benchmark.measure { puts with_hash }
puts Benchmark.measure { puts with_matrix }
