require 'digest'

def hash(num)
  Digest::MD5.hexdigest("bgvyzdsv#{num}")
end

def find_hash(prefix)
  adventcoin = (1..Float::INFINITY).lazy.select { |num|
    hash(num).start_with?(prefix)
  }.first
end

adventcoin = find_hash('00000')
puts "Adventcoin with five zeroes found at block #{adventcoin} with hash #{hash(adventcoin)}"

adventcoin = find_hash('000000')
puts "Adventcoin with six zeroes found at block #{adventcoin} with hash #{hash(adventcoin)}"
