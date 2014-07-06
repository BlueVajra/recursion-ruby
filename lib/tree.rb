require 'node'

class Tree

  def print_names(node)
    action = proc { |x| puts x.name }
    walk_tree(node, action)
  end

  def names(node)
    result_array = []
    action = proc { |x| result_array << x.name }
    walk_tree(node, action)
    result_array
  end

  def names_with_indentation(node)
    result_array = []
    action = proc do |x, level|
      result_array << ("  " * level) + x.name
    end
    walk_tree(node, action)
    result_array
  end

  def to_hash(node)
    result_hash = {}
    action = proc do |n, level, parent_hash|
      parent_hash[n.name] = {}
    end
    walk_tree(node, action, 0, result_hash)
    result_hash
  end

  private

  def walk_tree(node, action, level = 0, parent_hash = {})
    action.call(node, level, parent_hash)
    node.children.each do |child_node|
      parent = parent_hash[node.name] if parent_hash
      walk_tree(child_node, action, level + 1, parent)
    end
  end


end