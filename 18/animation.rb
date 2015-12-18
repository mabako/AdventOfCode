def read_state
  @state = IO.readlines('input.txt').map { |str|
    str.chomp.split('').map { |s| s == '#' and 1 or 0 }
  }
  @size = @state.length
end

def neighbors(x, y)
  ([0, x-1].max .. [x+1, @size-1].min).map { |xx|
    ([0, y-1].max .. [y+1, @size-1].min).map { |yy|
      if xx != x or yy != y then
        @state[xx][yy]
      else
        0
      end
    }.reduce(:+)
  }.reduce(:+)
end

def step(always_on = [])
  new_state = @state.clone
  @state = new_state.each_with_index.map { |e, x|
    v = e.each_with_index.map { |e, y|
      neighbor_count = neighbors(x, y)

      (if e == 1 then
        neighbor_count == 2 || neighbor_count == 3
      else
        neighbor_count == 3
      end) and 1 or 0
    }
  }
  always_on.each { |v|
    @state[v[0]][v[1]] = 1
  }
end

# pt 1
read_state
(1..100).each { |i|
  step
  puts "Lights on at #{i}: #{@state.map { |s| s.count(1) }.reduce(:+)}"
}

# pt 2
read_state
corners = [[0, 0], [0, @size - 1], [@size - 1, 0], [@size - 1, @size - 1]]
corners.each { |v|
  @state[v[0]][v[1]] = 1
}
(1..100).each { |i|
  step(corners)
  puts "Lights on at #{i}: #{@state.map { |s| s.count(1) }.reduce(:+)}"
}
