
require 'matrix'

def vector_key(v)
  "#{v[0]},#{v[1]}"
end

def write_rock_lines(rock_lines)
  canvas = {}

  rock_lines.each do |line|
    positions = line.split('->')

    (1..positions.length - 1).each do |i|
      p1 = positions[i - 1].split(',').map(&:to_i)
      p2 = positions[i].split(',').map(&:to_i)

      if p1[0] == p2[0]
        ([p1[1], p2[1]].min..[p1[1], p2[1]].max).each do |y|
          canvas["#{p1[0]},#{y}"] = '#'
        end
      end

      if p1[1] == p2[1]
        ([p1[0], p2[0]].min..[p1[0], p2[0]].max).each do |x|
          canvas["#{x},#{p1[1]}"] = '#'
        end
      end
    end
  end

  canvas
end

rock_lines = []
positions = []

File.readlines('Day-14').each do |line|
  rock_lines << line.strip
  line.strip.split('->').each do |v|
    positions << v.strip.split(',').map(&:to_i)
  end
end

max_depth = positions.max_by { |line| line[1] }[1]

canvas = write_rock_lines(rock_lines)

sand_pos = Vector[500, 0]
count = 0

while sand_pos[1] < max_depth + 1
  if canvas[vector_key(sand_pos + Vector[0, 1])].nil?
    sand_pos += Vector[0, 1]
  elsif canvas[vector_key(sand_pos + Vector[-1, 1])].nil?
    sand_pos += Vector[-1, 1]
  elsif canvas[vector_key(sand_pos + Vector[1, 1])].nil?
    sand_pos += Vector[1, 1]
  else
    canvas[vector_key(sand_pos)] = '*'
    count += 1
    sand_pos = Vector[500, 0]
  end
end

p count
