require_relative "piece.rb"
require_relative "null_piece.rb"
require "byebug"

class Board

  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @sentinel = NullPiece.new
    add_pieces
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @grid[row][col] = val
  end

  def cols
    @grid.transpose
  end

  def move_piece(start_pos, end_pos)
    start_piece = self[start_pos]
    end_piece = self[end_pos]
    raise "no piece" if start_piece.class == NullPiece
    raise "cell is occupied" unless end_piece.class == NullPiece

    self[end_pos], self[start_pos] = self[start_pos], self[end_pos]
  end

  def add_pieces
    @grid.each_with_index do |row, idx|

      if [0, 1, 6, 7].include?(idx)
        row.each_with_index do |cell, idx2|
          @grid[idx][idx2] = Piece.new
        end
      end

      if [2, 3, 4, 5].include?(idx)
        row.each_with_index do |cell, idx2|
          @grid[idx][idx2] = NullPiece.new
        end
      end

    end
  end

  def valid_pos?(pos)
    (0..7).include?(pos.first) && (0..7).include?(pos.last)
  end
end
