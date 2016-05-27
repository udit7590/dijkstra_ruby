class Graph
  attr_accessor :nodes
  attr_accessor :nodes_index
  attr_accessor :debug

  def initialize(nodes=[])
    self.nodes = nodes
    @nodes_index = {}
    nodes.each do |node|
      @nodes_index[node.vertex.primary_key] = node
    end
  end

  # Uses Dijkstra's Algo
  def shortest_paths(source)
    dist  = {}
    prev  = {}
    queue = []

    # Initialization
    nodes_index.keys.each do |vertex|
      dist[vertex] = Float::INFINITY
      prev[vertex] = nil
      queue << nodes_index[vertex]
    end
    dist[source.primary_key] = 0

    # Relaxation
    while(queue.length > 0) do
      u = dijkstra_min_distance(dist, queue)
      queue = dijkstra_remove_from_queue(u, queue)
      node_from_str(u).edges.each do |e|
        new_dist = dist[u.to_s] + e.length
        if new_dist < dist[e.destination.primary_key]
          dist[e.destination.primary_key] = new_dist
          prev[e.destination.primary_key] = u
        end
      end
    end

    in_debug_mode do
      puts "Distances: #{dist}"
      puts "Parents: #{prev}"
    end

    # Result
    [dist, prev]
  end

  def node_from_str(node_str)
    nodes_index[node_str]
  end

  private
    def dijkstra_min_distance(dist, queue)
      min_node = queue.first.vertex.primary_key
      nodes = queue.map(&:vertex).map(&:primary_key)
      dist.keys.select { |k| nodes.include?(k)}.each do |k|
        if (dist[k] < dist[min_node])
          min_node = k
        end
      end
      min_node
    end

    def dijkstra_remove_from_queue(vertex, queue)
      queue - [queue.select { |n| n.vertex.primary_key == vertex }.first]
    end

    def in_debug_mode(&block)
      if debug
        block.call
      end
    end
end
