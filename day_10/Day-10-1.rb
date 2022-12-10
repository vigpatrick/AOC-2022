x = 1
cycle = 0
cycle_summned = [20, 60, 100, 140, 180, 220]
sum = 0

File.readlines('Day-10').each do |line|
  cycle += 1
  sum += cycle * x if cycle_summned.include? cycle
  next if line.strip == 'noop'

  cycle += 1
  sum += cycle * x if cycle_summned.include? cycle

  x += line.split(' ')[1].to_i
end

p sum
