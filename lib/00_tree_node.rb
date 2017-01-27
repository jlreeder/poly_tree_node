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
    add_child(new_parent)
    @parent = new_parent
  end

  def add_child(new_parent)
    return nil unless new_parent
    new_parent.children << self unless new_parent.children.include?(self)
  end

  def remove_from_parent
    return nil unless parent
    parent.children.delete(self)
  end
end
