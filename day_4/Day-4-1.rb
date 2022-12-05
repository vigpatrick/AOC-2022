def contains_sect(a, b)
  a[0].to_i <= b[0].to_i && a[1].to_i >= b[1].to_i
end

count = 0

File.readlines('Day-4').each do |line|
  shifts = line.split(',')

  sect1 = shifts[0].split('-')
  sect2 = shifts[1].split('-')

  count += 1 if contains_sect(sect1, sect2) || contains_sect(sect2, sect1)
end

p count
