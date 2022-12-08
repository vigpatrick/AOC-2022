trees = []
visibles_inside = {}
count = 0

File.readlines('Day-8').each do |line|
  trees.push(line.strip.split('').map(&:to_i))
end

count += trees.length * 2
count += (trees[0].length - 2) * 2

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

p count + visibles_inside.length
