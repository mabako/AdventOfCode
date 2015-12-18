items = {
  'children' => proc { |n| n == 3 },
  'cats' => proc { |n| n > 7 },
  'samoyeds' => proc { |n| n == 2 },
  'pomeranians' => proc { |n| n < 3},
  'akitas' => proc { |n| n == 0 },
  'vizslas' => proc { |n| n == 0 },
  'goldfish' => proc { |n| n < 5 },
  'trees' => proc { |n| n > 3 },
  'cars' => proc { |n| n == 2 },
  'perfumes' => proc { |n| n == 1 }
}

IO.readlines('input.txt').each { |line|
  line =~ /Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/
  puts "Sue #{$1}" if items[$2].call($3.to_i) and items[$4].call($5.to_i) and items[$6].call($7.to_i)
}
