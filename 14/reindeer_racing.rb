class Reindeer
  def initialize(travelling_speed, travelling_time, resting_time)
    @travelling_speed = travelling_speed
    @travelling_time = travelling_time
    @resting_time = resting_time
    @cycle_time = travelling_time + resting_time
    @score = 0
  end

  def distance(time)
    distance = (time / @cycle_time) * (@travelling_speed * @travelling_time)

    time = [(time % @cycle_time), @travelling_time].min
    distance + time * @travelling_speed
  end

  def score!
    @score += 1
  end

  def score
    @score
  end
end

time = 2503
reindeers = IO.readlines('input.txt').map { |str|
  str =~ /fly (\d+) km\/s for (\d+) seconds, but then must rest for (\d+) seconds./
  Reindeer.new($1.to_i, $2.to_i, $3.to_i)
}

(1..time).each { |time|
  distances = reindeers.map { |r| [ r, r.distance(time) ] }.to_h
  distances.each { |r, dist| r.score! if dist == distances.values.max }
}

puts reindeers.max_by { |r| r.distance(time) }.distance(time), reindeers.max_by { |r| r.score }.score
