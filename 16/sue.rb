items = {
  'children' => 3,
  'cats' => 7,
  'samoyeds' => 2,
  'pomeranians' => 3,
  'akitas' => 0,
  'vizslas' => 0,
  'goldfish' => 5,
  'trees' => 3,
  'cars' => 2,
  'perfumes' => 1
}

IO.readlines('input.txt').each { |line|
  line =~ /Sue (\d+): (\w+): (\d+), (\w+): (\d+), (\w+): (\d+)/
  puts "Sue #{$1}" if items[$2] == $3.to_i and items[$4] == $5.to_i and items[$6] == $7.to_i
}
