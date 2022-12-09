require 'matrix'

visited = {}
pos_h = Vector[0, 0]
pos_t = Vector[0, 0]

moves = { L: Vector[-1, 0], R: Vector[1, 0], U: Vector[0, 1], D: Vector[0, -1] }

visited["#{pos_t[0]},#{pos_t[1]}"] = true

File.readlines('Day-9').each do |line|
  direction, steps = line.strip.split(' ')

  (1..steps.to_i).each do |_step|
    pos_h += moves[direction.to_sym]

    if (pos_h - pos_t).magnitude == 2
      pos_t += moves[direction.to_sym]
      visited["#{pos_t[0]},#{pos_t[1]}"] = true
    elsif (pos_h - pos_t).magnitude > 2
      diff = pos_h - pos_t
      pos_t += Vector[diff[0] / diff[0].abs, diff[1] / diff[1].abs]
      visited["#{pos_t[0]},#{pos_t[1]}"] = true
    end
  end
end

p visited.length
