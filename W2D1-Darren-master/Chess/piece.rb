require_relative "board.rb"
require 'colorize'

class Piece

  attr_reader :color, :board, :pos

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    "P"
  end

  def moves
  end

  def pos=(val)
    @pos = val
  end

  def symbol
    @color.to_sym
  end

  def valid_moves
  end

  def empty? #0 num of moves?
  end

  # def self.color(piece)
  # end

  private

  def move_into_check?(end_pos)
  end
end
