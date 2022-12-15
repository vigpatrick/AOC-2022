#Sensor at x=9, y=16: closest beacon is at x=10, y=16

def manhattan_distance(a, b)
  a.zip(b).map{ |u, v| (u - v).abs }.inject(:+)
end

def get_coordinates_just_outside(position, dist)
  coord = []

  (0..dist + 1).each do |i|
    coord << [position[0] + dist - i + 1, position[1] + i]
    coord << [position[0] - dist - i - 1, position[1] + i]
    coord << [position[0] + dist + i + 1, position[1] - i]
    coord << [position[0] - dist - i - 1, position[1] - i]
  end

  coord
end

def verify_coords_other_sensors(coord, sensors)
  res = []
  max = 20
  min = 0

  coord.each do |c|
    ok = true
    x, y = c
    next if x < min || x > max || y < min || y > max
    sensors.each do |sensor|
      if manhattan_distance([sensor[:sen_x], sensor[:sen_y]], [x, y]) <= sensor[:dist]
        ok = false
        break
      end
    end
    if ok
      res = c
      break
    end
  end

  res
end

require 'matrix'

sensors = []

File.readlines('Day-15').each do |line|
  splitted = line.strip.split(' ').select { |word| word.include? '=' }

  sens_data = {
    sen_x: splitted[0].split('=')[1].to_i,
    sen_y: splitted[1].split('=')[1].to_i,
    bea_x: splitted[2].split('=')[1].to_i,
    bea_y: splitted[3].split('=')[1].to_i
  }

  sens_data[:dist] = manhattan_distance([sens_data[:sen_x], sens_data[:sen_y]], [sens_data[:bea_x], sens_data[:bea_y]])

  sensors << sens_data
end

coord = []
sensors.each do |sensor|
  coord = get_coordinates_just_outside([sensor[:sen_x], sensor[:sen_y]], sensor[:dist])

  res = verify_coords_other_sensors(coord, sensors)

  unless res.empty?
    p res
    p res[0] * 4_000_000 + res[1]
    break
  end
end
