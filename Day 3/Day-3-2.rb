score = 0
lines = []

File.readlines('Day-3-1').each do |line|
  lines.push(line)

  if !lines[2].nil?
    lines[0].split('').each do |item|
      if lines[1].include?(item) && lines[2].include?(item)
        score += item.ord < 97 ? item.ord - 38 : item.ord - 96
        break
      end
    end
    lines.clear
  end
end

p score
