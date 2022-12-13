
def compare_list(left, right)
  max_idx = [left.size, right.size].max
  (0..max_idx - 1).each do |idx|
    left_val = left[idx]
    right_val = right[idx]

    return true if left_val.nil? && !right_val.nil?
    return false if right_val.nil? && !left_val.nil?

    if left_val.is_a?(Integer) && right_val.is_a?(Integer)
      return true if left_val < right_val
      return false if left_val > right_val
    end

    res = compare_list([left_val], right_val) if left_val.is_a?(Integer) && right_val.is_a?(Array)
    res = compare_list(left_val, [right_val]) if left_val.is_a?(Array) && right_val.is_a?(Integer)
    res = compare_list(left_val, right_val) if left_val.is_a?(Array) && right_val.is_a?(Array)
    return res unless res.nil?
  end
  nil
end

lists = []
File.readlines('Day-13').each do |line|
  lists << eval(line.strip)
end

lists << [[2]]
lists << [[6]]
lists = lists.compact

lists =
  lists.sort do |left, right|
    res = compare_list(left, right)
    if res.nil?
      0
    elsif res
      -1
    else
      1
    end
  end

ids = []
lists.each_with_index do |val, idx|
  ids << (idx + 1) if [[[2]], [[6]]].include?(val)
end
p ids.inject(:*)
