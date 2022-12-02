choices = {
  'A': {X: 3, Y: 4, Z: 8},
  'B': {X: 1, Y: 5, Z: 9},
  'C': {X: 2, Y: 6, Z: 7}
}

score = 0

File.readlines('Day-2-2').each do |line|
  score += choices[line[0].to_sym][line[2].to_sym]
end

p score
