happiness = Hash.new { |h,k| h[k] = {} }

IO.readlines('input.txt').each { |str|
  str =~ /(\w+) would (\w+) (\d+) happiness units by sitting next to (\w+)./
  happiness[$1][$4] = if $2 == 'gain' then $3.to_i else -$3.to_i end
}

=begin
happiness.keys.each { |k|
  happiness['self'][k] = 0
  happiness[k]['self'] = 0
}
=end

puts happiness.keys.permutation.map { |perm|
  (perm << perm[0]).each_cons(2).map { |a, b|
    happiness[a][b] + happiness[b][a]
  }.reduce(&:+)
}.max
