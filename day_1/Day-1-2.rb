results = []

temp = 0

File.readlines('Day-1-2').each do |line|
  val = line.to_i

  if val != 0
    temp += val
  else
    results.push(temp)
    temp = 0
  end
end

results = results.sort.reverse

p results[0] + results[1] + results[2]
