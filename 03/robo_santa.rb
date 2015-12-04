santa_position = [0, 0]
robo_santa_position = [0, 0]
@visited = { santa_position => true, robo_santa_position => true }

input = IO.read("input.txt")

def move(instruction, position)
  case instruction
  when "<" then position[0] -= 1
  when ">" then position[0] += 1
  when "^" then position[1] -= 1
  when "v" then position[1] += 1
  end

  @visited[position.clone] = true
end


input.split("").each_with_index do |char, index|
  if index.even? then
    move(char, santa_position)
  else
    move(char, robo_santa_position)
  end
end

puts "The Santas visited #{@visited.length} houses"
