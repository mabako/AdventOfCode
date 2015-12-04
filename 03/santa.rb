position = [0, 0]
visited = { position => true }

input = IO.read("input.txt")

input.split("").each do |char|
  case char
  when "<" then position[0] = position[0] - 1
  when ">" then position[0] = position[0] + 1
  when "^" then position[1] = position[1] - 1
  when "v" then position[1] = position[1] + 1
  end

  visited[position.clone] = true
end

puts "Santa visited #{visited.length} houses"
