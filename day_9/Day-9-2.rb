require 'matrix'

visited = {}
knots = []

(0..9).each do |i|
  knots[i] = Vector[0, 0]
end

moves = { L: Vector[-1, 0], R: Vector[1, 0], U: Vector[0, 1], D: Vector[0, -1] }

visited["#{knots[9][0]},#{knots[9][1]}"] = true

File.readlines('Day-9').each do |line|
  direction, steps = line.strip.split(' ')

  (1..steps.to_i).each do |_step|
    knots[0] += moves[direction.to_sym]

    (1..9).each do |i|
      diff = knots[i - 1] - knots[i]

      if diff.magnitude == 2
        knots[i] += diff.normalize
        visited["#{knots[i][0]},#{knots[i][1]}"] = true if i == 9
      elsif diff.magnitude > 2
        knots[i] += Vector[diff[0] / diff[0].abs, diff[1] / diff[1].abs]
        visited["#{knots[i][0]},#{knots[i][1]}"] = true if i == 9
      end
    end
  end
end

p visited.length
