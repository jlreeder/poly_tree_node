require_relative '00_tree_node'

class KnightPathFinder

  attr_reader :move_tree

  def initialize(pos)
    @move_tree = build_move_tree(pos)
  end

  def build_move_tree(pos)
    PolyTreeNode.new(pos)
  end

end
