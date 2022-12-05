score = 0

File.readlines('Day-3-1').each do |line|
  first,second = line.partition(/.{#{line.size/2}}/)[1,2]

  first.split('').each do |item|
    if second.include?(item)
      score += item.ord < 97 ? item.ord - 38 : item.ord - 96
      break
    end
  end
end

p score
