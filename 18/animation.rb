@input = IO.readlines('input.txt')
@size = @input.count

def neighbors(x, y)
  ([0, x-1].max .. [x+1, @size-1].min).map { |xx|
    ([0, y-1].max .. [y+1, @size-1].min).map { |yy|
      (xx != x or yy != y) ? @state[xx][yy] : false
    }.count(true)
  }.reduce(:+)
end

def step
  @state = @state.each_with_index.map { |e, x|
    v = e.each_with_index.map { |e, y|
      neighbor_count = neighbors(x, y)

      e ? (neighbor_count == 2 || neighbor_count == 3) : neighbor_count == 3
    }
  }
end

def force_lights(lights)
  lights.each { |v| @state[v[0]][v[1]] = true }
end

[[], [[0, 0], [0, @size - 1], [@size - 1, 0], [@size - 1, @size - 1]]].each { |always_on|
  @state = @input.map { |str| str.chomp.split('').map { |s| s == '#' } }
  force_lights(always_on)

  100.times { step; force_lights(always_on) }
  puts @state.map { |s| s.count(true) }.reduce(:+)
}
