require 'digest'

@input = IO.read('input.txt').strip
def hash(num)
  Digest::MD5.hexdigest("#{@input}#{num}")
end

def find_hash(prefix)
  adventcoin = (1..Float::INFINITY).lazy.select { |num|
    hash(num).start_with?(prefix)
  }.first
end

(5..6).each { |num|
  adventcoin = find_hash('0' * num)
  puts "Adventcoin with #{num} zeroes found at block #{adventcoin} with hash #{hash(adventcoin)}"
}
