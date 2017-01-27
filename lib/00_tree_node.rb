class PolyTreeNode

  attr_accessor :children
  attr_reader :value, :parent

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(other_node)
    @parent = other_node
    other_node.children << self
  end

end
