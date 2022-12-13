

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
idx = 1
sum = 0

File.readlines('Day-13').each do |line|
  if line.strip == ''
    sum += idx if compare_list(lists[0], lists[1])
    idx += 1
    lists.clear
  else
    lists << eval(line.strip)
  end
end

p sum
