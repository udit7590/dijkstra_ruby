class Node
  attr_accessor :vertex, :edges

  def initialize(vertex, edges=[])
    self.vertex = vertex
    self.edges = edges
  end

  def to_s
    "Node: Vertex=#{vertex.to_s}"
  end
end
