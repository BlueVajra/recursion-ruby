require 'node'

class Tree

  def print_names(node)
    action = lambda { |x| puts x.name }
    walk_tree(node, action)
  end

  def names(node)
    @result_array = []
    action = lambda { |x| @result_array << x.name }
    walk_tree(node, action)
    @result_array
  end

  def names_with_indentation(node)
    @result_array = []
    indent_tree(node, 0)
    @result_array
  end

  def indent_tree(node, level)
    @result_array <<  ("  " * level) + node.name
    node.children.each do |y|
      indent_tree(y, (level + 1))
    end
  end

  private

  def walk_tree(node, action)
    action.call(node)
    node.children.each do |child_node|
      walk_tree(child_node, action)
    end
  end


end