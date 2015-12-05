def enough_vowels?(str)
  str.scan(/[aeiou]/).count >= 3
end

def double_letter?(str)
  !(str =~ /(.)\1/).nil?
end

def no_illegal_strings?(str)
  (str =~ /(ab|cd|pq|xy)/).nil?
end

def nice?(str)
  enough_vowels?(str) and double_letter?(str) and no_illegal_strings?(str)
end

puts IO.readlines('input.txt').count{ |s| nice? s }
