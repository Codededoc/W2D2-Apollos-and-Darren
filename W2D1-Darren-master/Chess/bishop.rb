require "piece.rb"
require "board.rb"
require "sliding_mod.rb"

class Bishop < Piece
  include module SlidingPiece

  def initialize(pos, board, color)
    @pos = pos
    @board = board
    @color = color
  end

  def move_dirs
    diagonal_dirs
  end

end
