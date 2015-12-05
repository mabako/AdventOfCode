def pair_of_letters_twice?(str)
  !(str =~ /(..).*\1/).nil?
end

def one_letter_between?(str)
  !(str =~ /(.).\1/).nil?
end

def nice?(str)
  pair_of_letters_twice?(str) and one_letter_between?(str)
end

puts IO.readlines('input.txt').count{ |s| nice? s }
