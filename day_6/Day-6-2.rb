File.readlines('Day-6').each do |line|
  (13..line.length).each do |i|
    substring = line.slice(i - 13..i)

    if substring.split('').uniq.length == 14
      p i + 1
      break
    end
  end
end
