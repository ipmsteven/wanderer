require 'graphviz'

nodes = ["1","2","3","4","5"]
# Create a new graph
g = GraphViz.new( :G, :type => :digraph )

g.node[:shape] = "ellipse"
g.node[:color] = "red"

g.edge[:color] = "red"
g.edge[:weight] = "1"
g.edge[:style] = "filled"
g.edge[:label] = ""

g[:size] = "4,4"

# Create two nodes
nodes[0...-1].each_with_index do |item, index|
  a = g.add_nodes(item.to_s)
  b = g.add_nodes(nodes[index+1].to_s)
  g.add_edges(a, b)
end

# Generate output image
g.output( :png => "chain.png" )
#puts g.output( :canon => String )
