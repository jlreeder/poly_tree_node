require_relative '00_tree_node'

class KnightPathFinder

  KNIGHT_MOVES = [
    [ 1,  2],
    [-1,  2],
    [ 2, -1],
    [ 2,  1],
    [-1, -2],
    [ 1, -2],
    [-2,  1],
    [-2, -1]
  ]

  attr_reader :move_tree

  def self.valid_moves(pos)
    x, y = pos
    moves = KNIGHT_MOVES.map do |k_pos|
      k_x, k_y = k_pos
      [ (x + k_x), (y + k_y) ]
    end

    moves.select { |move| move.all? { |el| el.between?(0, 9) } }
  end

  def initialize(pos)
    @move_tree = build_move_tree(pos)
    @visited_positions = [pos]
  end

  def build_move_tree(pos)
    PolyTreeNode.new(pos)
  end

end
