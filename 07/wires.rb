class String
  def int
    Integer(self) if Integer(self) rescue false
  end
end

w = IO.readlines('input.txt').map{ |line|
  line =~ /\A(.*) -> (\w+)\Z/
  [$2, $1.int || $1]
}

@wires = Hash[w]

def solve(key)
  return key.int if key.int

  expression = @wires[key]
  raise "Wire #{key} not found" if expression.nil?

  if expression.is_a? Integer then
    expression
  else
    value = nil

    if expression =~ /NOT (\w+)/ then
      value = solve($1) ^ 0xFFFF
    elsif expression =~ /(\w+) AND (\w+)/ then
      value = solve($1) & solve($2)
    elsif expression =~ /(\w+) OR (\w+)/ then
      value = solve($1) | solve($2)
    elsif expression =~ /(\w+) LSHIFT (\d+)/ then
      value = solve($1) << $2.to_i
    elsif expression =~ /(\w+) RSHIFT (\d+)/ then
      value = solve($1) >> $2.to_i
    else
      value = solve(expression)
    end

    @wires[key] = value.to_i
  end
end

a = solve('a')
puts "a: #{a}"
@wires = Hash[w]
@wires['b'] = a
puts "a: #{solve('a')}"
