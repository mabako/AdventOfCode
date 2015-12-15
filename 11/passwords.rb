input = 'cqjxjnds'

def forbidden_letters?(str)
  str =~ /[iol]/
end

@straight_letters = ('a'..'x').map { |s| "#{s}#{s.next}#{s.next.next}" }.reject { |s| forbidden_letters?(s) }.map { |s| Regexp.new(s) }
def straight_letters?(str)
  @straight_letters.any? { |s| s =~ str }
end

def letter_pairs?(str)
  str.scan(/(.)\1/).uniq.length >= 2
end

def valid?(str)
  !forbidden_letters?(str) and straight_letters?(str) and letter_pairs?(str)
end

input.next! until valid?(input)
# input.next!
# input.next! until valid?(input)
puts input
