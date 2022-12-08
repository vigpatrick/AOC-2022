trees = []
visibles_inside = {}

File.readlines('Day-8').each do |line|
  trees.push(line.strip.split('').map(&:to_i))
end

end_array_inside = trees.length - 2

# TOP - DOWN && DOWN - TOP
(1..end_array_inside).each do |x|
  orientation_highest = trees[0][x]
  inv_orientation_highest = trees[trees.length - 1][x]
  (1..end_array_inside).each do |y|
    break if orientation_highest == 9 && inv_orientation_highest == 9
    if trees[y][x] > orientation_highest
      visibles_inside["#{x},#{y}"] = true
      orientation_highest = trees[y][x]
    end

    if trees[end_array_inside - y + 1][x] > inv_orientation_highest
      visibles_inside["#{x},#{end_array_inside - y + 1}"] = true
      inv_orientation_highest = trees[end_array_inside - y + 1][x]
    end
  end
end

end_array_inside = trees[0].length - 2

# LEFT - Right && Right Left
(1..end_array_inside).each do |y|
  orientation_highest = trees[y][0]
  inv_orientation_highest = trees[y][trees[0].length - 1]
  (1..end_array_inside).each do |x|
    break if orientation_highest == 9 && inv_orientation_highest == 9
    if trees[y][x] > orientation_highest
      visibles_inside["#{x},#{y}"] = true
      orientation_highest = trees[y][x]
    end

    if trees[y][end_array_inside - x + 1] > inv_orientation_highest
      visibles_inside["#{end_array_inside - x + 1},#{y}"] = true
      inv_orientation_highest = trees[y][end_array_inside - x + 1]
    end
  end
end

highest_val = 0

visibles_inside.each do |key, _value|
  position = key.split(',').map(&:to_i)
  orientations = [[0, 1], [0, -1], [1, 0], [-1, 0]]
  vals = [0, 0, 0, 0]

  orientations.each_with_index do |orientation, i|
    steps = 1
    while true
      new_pos = [position[0] + steps * orientation[0], position[1] + steps * orientation[1]]

      if new_pos[0].zero? || new_pos[1].zero? || new_pos[0] == trees.length - 1 || new_pos[1] == trees[0].length - 1 || trees[new_pos[1]][new_pos[0]] >= trees[position[1]][position[0]]
        vals[i] = steps
        break
      end
      steps += 1
    end
  end

  res = vals.reduce(1) { |mult, num| mult * num }

  highest_val = res if res > highest_val
end

p highest_val
