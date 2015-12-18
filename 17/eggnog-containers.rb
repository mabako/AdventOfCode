input = IO.readlines('input.txt').map { |n| n.to_i }
expected = 150

v = [*0..1].repeated_permutation(input.length).map { |perm|
  containers = perm.zip(input).map { |x,y| x*y }
  if containers.reduce(:+) == expected then
    containers.reject { |n| n == 0 }
  else
    nil
  end
}.reject { |n| n.nil? }
puts v.count

min = v.map { |a| a.length }.min
puts v.count { |a| a.length == min }
