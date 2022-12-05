cargo = [
  %w[M J C B F R L H],
  %w[Z C D],
  %w[H J F C N G W],
  %w[P J D M T S B],
  %w[N C D R J],
  %w[W L D Q P J G Z],
  %w[P Z T F R H],
  %w[L V M G],
  %w[C B G P F Q R J]
]


File.readlines('Day-5').each do |line|
  count = line.split(' ')[1].to_i
  from = line.split(' ')[3].to_i - 1
  to = line.split(' ')[5].to_i - 1

  cargo[to] = cargo[to] + cargo[from].pop(count)
end

string = ''

cargo.each do |stack|
  string += stack.last
end

p string
