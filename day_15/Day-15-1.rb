#Sensor at x=9, y=16: closest beacon is at x=10, y=16

def manhattan_distance(a, b)
  a.zip(b).map{ |u, v| (u - v).abs }.inject(:+)
end

require 'matrix'

sensors = []

low_x = 100000000000
high_x = 0

File.readlines('Day-15').each do |line|
  splitted = line.strip.split(' ').select { |word| word.include? '=' }

  sens_data = {
    sen_x: splitted[0].split('=')[1].to_i,
    sen_y: splitted[1].split('=')[1].to_i,
    bea_x: splitted[2].split('=')[1].to_i,
    bea_y: splitted[3].split('=')[1].to_i
  }

  sens_data[:dist] = manhattan_distance([sens_data[:sen_x], sens_data[:sen_y]], [sens_data[:bea_x], sens_data[:bea_y]])

  low_x = sens_data[:sen_x] - sens_data[:dist] if sens_data[:sen_x] < low_x
  low_x = sens_data[:bea_x] + sens_data[:dist]if sens_data[:bea_x] < low_x
  high_x = sens_data[:sen_x] - sens_data[:dist] if sens_data[:sen_x] > high_x
  high_x = sens_data[:bea_x] + sens_data[:dist] if sens_data[:bea_x] > high_x

  sensors << sens_data
end

count = 0
y = 2_000_000

p low_x
p high_x

(low_x..high_x).each do |x|
  ok = true
  sensors.each do |sensor|
    break if sensor[:bea_x] == x && sensor[:bea_y] == y
    dist = manhattan_distance([sensor[:sen_x], sensor[:sen_y]], [x, y])

    if dist <= sensor[:dist]
      ok = false
      break
    end
  end
  count += 1 unless ok
end

p count

