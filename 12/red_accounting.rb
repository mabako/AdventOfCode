class Array
  def values
    self
  end
end

def reduce(input)
  if input.is_a?(Hash) and input.values.include?('red') then
    return 0
  end

  input.values.map { |v|
    if v.is_a? Integer then
      v
    elsif v.is_a?(Array) || v.is_a?(Hash)
      reduce(v)
    else
      0
    end
  }.reduce(&:+)
end

input = eval IO.read('input.txt')
puts reduce(input)
