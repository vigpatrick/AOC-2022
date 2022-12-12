class Monkey
  attr_reader :count

  def initialize(lines)
    @name = lines[0].strip.split(' ')[1].to_i
    @items = lines[1].split(':')[1].strip.split(',').map(&:to_i)
    @operation = lines[2].split('=')[1].strip.freeze
    @divisible_test = lines[3].split('by')[1].to_i
    @monkey_true = lines[4].split('monkey')[1].to_i
    @monkey_false = lines[5].split('monkey')[1].to_i
    @count = 0
  end

  def push_item(val)
    @items.push(val)
  end

  def play_round
    sent_item = []

    @count += @items.length
    @items.each do |item|
      a, op, b = (@operation.dup.gsub! 'old', item.to_s).split(' ')

      new_val = op == '*' ? a.to_i * b.to_i : a.to_i + b.to_i
      new_val /= 3

      if (new_val % @divisible_test).zero?
        sent_item.push([@monkey_true, new_val])
      else
        sent_item.push([@monkey_false, new_val])
      end
    end

    @items.clear

    sent_item
  end
end

monkeys = []
lines = []

File.readlines('Day-11').each do |line|
  if line.strip == ''
    monkeys.push(Monkey.new(lines))
    lines.clear
  else
    lines.push(line)
  end
end

monkeys.push(Monkey.new(lines))

20.times do
  monkeys.each do |monkey|
    results = monkey.play_round

    results.each do |new_monkey, item|
      monkeys[new_monkey].push_item(item)
    end
  end
end

scores = monkeys.map(&:count).sort.reverse

p scores[0] * scores[1]
