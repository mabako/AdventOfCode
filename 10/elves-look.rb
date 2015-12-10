str = '3113322113'

1.upto(50) { str.gsub!(/(\d)\1*/) { |s, x| s.length.to_s + $1 } }

puts str.length
