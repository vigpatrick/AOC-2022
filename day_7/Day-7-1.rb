class Dir
  attr_reader :parent

  def initialize(name, parent)
    @name = name
    @size = 0
    @children = {}
    @parent = parent
  end

  def add_to_size(value)
    @size += value
  end

  def add_children(name)
    @children[name] = Dir.new(name, self) unless @children.key?(name)
  end

  def get_children(name)
    add_children(name)
    @children[name]
  end

  def total_size
    size_children = 0
    @children.each do |_name, obj|
      size_children += obj.total_size
    end

    @size + size_children
  end

  def solution
    total = 0
    @children.each do |_name, obj|
      total += obj.solution
    end
    my_size = total_size

    my_size <= 100_000 ? total + my_size : total
  end
end

current_dir = nil
root_dir = nil

File.readlines('Day-7').each do |line|
  splitted_line = line.split(' ')

  if splitted_line[1] == 'cd' && splitted_line[2] != '..'
    if current_dir.nil?
      root_dir = Dir.new(splitted_line[2], nil)
      current_dir = root_dir
    else
      current_dir = current_dir.get_children(splitted_line[2])
    end
  elsif splitted_line[1] == 'cd' && splitted_line[2] == '..'
    current_dir = current_dir.parent
  elsif splitted_line[1] == 'ls'
    next
  elsif splitted_line[0] == 'dir'
    current_dir.add_children(splitted_line[1])
  else
    current_dir.add_to_size(splitted_line[0].to_i)
  end
end

p root_dir.total_size
p root_dir.solution
