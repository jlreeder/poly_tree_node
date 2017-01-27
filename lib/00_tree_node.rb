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
    elsif new_parent != parent && parent
      # debugger
      parent.children.delete(self)
      new_parent.children << self unless new_parent.children.include?(self)
    else
      new_parent.children << self unless new_parent.children.include?(self)
    end
    @parent = new_parent
  end

  # def add_child(parent)
  #   other_node.children << self unless other_node.children.include?(self)
  # end
  #
  # def remove_child
  # end
end
