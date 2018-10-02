require_relative "piece.rb"

class NullPiece < Piece

  attr_reader :nullpiece

  def initialize
    @value = nil
  end

  def to_s
    "*"
  end


end
