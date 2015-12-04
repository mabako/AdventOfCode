input = IO.read("input.txt")

current_floor = 0
input.split("").each_with_index { |char, index|
  current_floor = current_floor + (char == "(" ? 1 : -1)
  if current_floor < 0 then
    puts "You went underground on step #{index + 1}."
    exit
  end
}

puts "You didn't go underground...?"
