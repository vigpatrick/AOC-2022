File.readlines('Day-6').each do |line|
  (3..line.length).each do |i|
    substring = line.slice(i - 3..i)

    if substring.split('').uniq.length == 4
      p i + 1
      break
    end
  end
end
