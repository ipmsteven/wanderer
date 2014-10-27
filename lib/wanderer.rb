require "wanderer/version"
require 'graphviz'

module Wanderer

  def self.walk(receiver, look_up_method)
    visited = search(receiver, look_up_method)

    g = GraphViz.new( :G, :type => :digraph )

    visited[0...-1].each_with_index do |item, index|
      a = g.add_nodes(item.to_s)
      b = g.add_nodes(visited[index+1].to_s)
      g.add_edges(a, b)
    end

    # Generate output image
    g.output( :png => "chain.png" )
    visited
  end

  def self.search(receiver, look_up_method)
    visited = []
    ancestors = receiver.singleton_class.ancestors

    ancestors.each do |ancestor|
      visited << ancestor
      return visited if ancestor.instance_methods(false).include?(look_up_method.to_sym)
    end

    visited << "method_missing"

    ancestors.each do |ancestor|
      visited << ancestor
      return visited if ancestor.instance_methods(false).include? :method_missing
    end
  end
end
