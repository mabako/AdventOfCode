ingredients = [
  #[-1, -2, 6, 3, 8],
  #[2, 3, -2, -1, 3]
  [5, -1, 0, 0, 5],
  [-1, 3, 0, 0, 1],
  [0, -1, 4, 0, 6],
  [-1, 0, 0, 2, 8]
]

teaspoons = 100
puts (0..teaspoons).map { |a|
  (0..(teaspoons-a)).map { |b|
    (0..(teaspoons-a-b)).map { |c|
      d = teaspoons - a - b - c
      if a * ingredients[0][4] + b * ingredients[1][4] + c * ingredients[2][4] + d * ingredients[3][4] != 500 then
        0
      else
        (0..3).map { |v| [0, a * ingredients[0][v] + b * ingredients[1][v] + c * ingredients[2][v] + d * ingredients[3][v]].max }.reduce(:*)
      end
    }.max
  }.max
}.max
