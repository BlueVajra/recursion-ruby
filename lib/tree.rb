require 'node'

class Tree
  def initialize
    @result_array = []
  end

  def print_names(node)
    puts node.name
    node.children.each do |child_node|
      print_names(child_node)
    end
  end

  def names(node)
    add_names(node)
    @result_array
  end

  def add_names(node)
    @result_array << node.name
    node.children.each do |child_node|
      add_names(child_node)
    end
  end


end