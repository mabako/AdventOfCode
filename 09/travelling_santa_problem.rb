distance = Hash.new { |h,k| h[k] = {} }

IO.readlines('input.txt').each { |line|
  line =~ /(\w+) to (\w+) = (\d+)/
  distance[$2][$1] = distance[$1][$2] = $3.to_i
}

puts distance.keys.permutation.map {|perm|
  # puts "Travelling via #{perm}"
  perm.each_cons(2).inject(0) do |total, (first, second)|
    # puts first, second, distance[first][second], ''
    total + distance[first][second]
  end
}.minmax
