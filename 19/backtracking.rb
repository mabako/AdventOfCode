molecule = IO.read('molecule.txt').strip

@transformations = Hash.new
@electron_transformations = []
IO.readlines('transformations.txt').each { |line|
  line =~ /\A(\w+) => (\w+)\Z/

  if $1 == 'e'
    @electron_transformations << $2
  else
    @transformations[$2] = $1
  end
}
@transformations = @transformations.sort_by { |from, to| from.length }.reverse # fastest number of steps through biggest replacements?

def step(molecule, step)
  raise "Found at #{step}" if @electron_transformations.include?(molecule)

  @transformations.each { |(from, to)|
    molecule.match(from) { |m|
      s = molecule.clone
      s[m.begin(0) .. m.end(0)-1] = to
      step(s, step + 1)
    }
  }
end

begin
  step(molecule, 1)
rescue => e
  puts e
end
