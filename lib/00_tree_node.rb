require "byebug"

class PolyTreeNode

  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(new_parent)
    remove_from_parent
    add_to_parent(new_parent)
    @parent = new_parent
  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise 'Node is not a child' unless children.include?(child_node)
    child_node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |child|
      result = child.dfs(target_value)

      return result unless result.nil?
    end

    nil
  end

  private

  def add_to_parent(new_parent)
    return nil unless new_parent
    new_parent.children << self unless new_parent.children.include?(self)
  end

  def remove_from_parent
    return nil unless parent
    parent.children.delete(self)
  end
end
