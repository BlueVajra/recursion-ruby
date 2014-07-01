require 'node'

class Tree
  def initialize
    @result_array = []
  end

  def print_names(node)
    action = lambda {|x| puts x.name}
    walk_tree(node, action)
  end

  def names(node)
    action = lambda {|x| @result_array << x.name}
    walk_tree(node, action)
    @result_array
  end

  def walk_tree(node, action)
    action.call(node)
    node.children.each do |child_node|
      walk_tree(child_node,action)
    end
  end


end