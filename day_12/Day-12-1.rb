require 'matrix'

def bfs(start, map)
  queue = [start]
  v_neighbors = [
    Vector[0, 1],
    Vector[0, -1],
    Vector[1, 0],
    Vector[-1, 0]
  ]

  visited = {}
  depth = 0

  until queue.empty?
    (0..queue.length - 1).each do
      node = queue.shift
      next if visited[node.to_s]

      visited[node.to_s] = true
      if map[node[1]][node[0]] == 123
        p depth
        queue.clear
        break
      end

      v_neighbors.each do |v|
        node_exist = !map[node[1] + v[1]].nil? && !map[node[1] + v[1]][node[0] + v[0]].nil?
        queue.push(node + v) if node_exist && map[node[1] + v[1]][node[0] + v[0]] <= map[node[1]][node[0]] + 1
      end
    end
    depth += 1
  end
end

map = []

File.readlines('Day-12').each do |line|
  map.push(line.strip.split('').map(&:ord))
end

start = nil
ending = nil

map.each_with_index do |row, i|
  row.each_with_index do |node, j|
    start = Vector[j, i] if node == 83
    ending = Vector[j, i] if node == 69
  end
end

map[start[1]][start[0]] = 96
map[ending[1]][ending[0]] = 123

bfs(start, map)
