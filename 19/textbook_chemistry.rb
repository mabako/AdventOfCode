molecule = IO.read('molecule.txt').strip

transformations = Hash.new { |h, k| h[k] = [] }
IO.readlines('transformations.txt').each { |line|
  line =~ /\A(\w+) => (\w+)\Z/
  transformations[$1] << $2 unless $1 == 'e'
}

split_molecule = molecule.split(/(?=[A-Z0-9])/)

puts split_molecule.map { |atom|
  transformations[atom]
}.each_with_index.reduce([]) { |total, (elem, i)|
  total + elem.map { |t|
    m = split_molecule.clone
    m[i] = t
    m.reduce(:+)
  }
}.uniq.count
