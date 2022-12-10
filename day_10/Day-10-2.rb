def process_cycle_crt(cycle, crt_rows, x)
  crt_row = (cycle / 40).to_i
  crt_rows.push('') if crt_rows[crt_row].nil?

  crt_pos = cycle - 40 * crt_row

  append = crt_pos >= (x - 1) && crt_pos <= (x + 1) ? '#' : '.'
  crt_rows[crt_row] << append

  [cycle + 1, crt_rows]
end

x = 1
cycle = 0
crt_rows = []

File.readlines('Day-10').each do |line|
  cycle, crt_rows = process_cycle_crt(cycle, crt_rows, x)

  next if line.strip == 'noop'

  cycle, crt_rows = process_cycle_crt(cycle, crt_rows, x)

  x += line.split(' ')[1].to_i
end

crt_rows.each do |row|
  p row
end
