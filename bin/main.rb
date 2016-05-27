require_relative '../lib/vertex.rb'
require_relative '../lib/edge.rb'
require_relative '../lib/node.rb'
require_relative '../lib/graph.rb'

# Test
v1 = Vertex.new(1,1)
v2 = Vertex.new(2,2)
v3 = Vertex.new(3,3)
v4 = Vertex.new(4,4)
v5 = Vertex.new(5,5)
e1 = Edge.new(v1,v2,3)
e2 = Edge.new(v1,v3,1)
e3 = Edge.new(v2,v3,5)
e4 = Edge.new(v3,v4,8)
e5 = Edge.new(v1,v4,4)
e6 = Edge.new(v4,v5,10)

n1 = Node.new(v1, [e1,e2,e5])
n2 = Node.new(v2, [e3])
n3 = Node.new(v3, [e4, e6])
n4 = Node.new(v4, [e6])
n5 = Node.new(v5)

g  = Graph.new([n1, n2, n3, n4, n5])
g.debug = true
g.shortest_paths(v1)
