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

    if new_parent.nil?
      parent.children.delete(self)
    elsif new_parent != parent #&& parent
      remove_from_parent
      add_child(new_parent)
    else
      add_child(new_parent)
    end
    @parent = new_parent
  end

  def add_child(parent)
    parent.children << self unless parent.children.include?(self)
  end

  def remove_from_parent
    return nil unless parent
    parent.children.delete(self)
  end
end
