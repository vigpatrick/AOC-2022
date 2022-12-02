results = []

temp = 0

File.readlines('Day-1-1').each do |line|
  val = line.to_i

  if val != 0
    temp += val
  else
    results.push(temp)
    temp = 0
  end
end

p results.max
