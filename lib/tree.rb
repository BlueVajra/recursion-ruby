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
    add_hashes(node, result_hash)
    result_hash
  end

  def add_hashes(node, parent_hash)
    parent_hash[node.name] = {}
    node.children.each do |child|
      add_hashes(child, parent_hash[node.name])
    end
  end

  private

  def walk_tree(node, action, level = 0)
    action.call(node, level)
    node.children.each do |child_node|
      walk_tree(child_node, action, level + 1)
    end
  end


end