choices = {
  'X': {value: 1, A: 3, B: 0, C: 6},
  'Y': {value: 2, A: 6, B: 3, C: 0},
  'Z': {value: 3, A: 0, B: 6, C: 3},
}

score = 0

File.readlines('DAY-2-1').each do |line|
  score += choices[line[2].to_sym ][:value] + choices[line[2].to_sym ][line[0].to_sym ]
end

p score
