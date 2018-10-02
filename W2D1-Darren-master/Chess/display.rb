require_relative 'board.rb'
require_relative 'cursor.rb'
require 'colorize'

class Display

  attr_reader :board

  def initialize
    @board = Board.new
    @cursor = Cursor.new([0,0], board)
  end

  def render
    # puts "    " + (0..7).to_a.join("  ")
    # print "1   "
    # board.grid[0].each { |tile| print tile.value + "  "}
    #iterate through each object_peice, and puts its value
    puts "    #{(0..7).to_a.join("  ")}"
    puts
    board.grid.each_with_index do |row, i|
      print " #{i} "
      row.each_with_index do |tile, j|
        if [i, j] == @cursor.cursor_pos
          print " #{tile.to_s.colorize(:green) } ".colorize(:background => :gray)
        elsif (i + j).even?
          print " #{tile.to_s.bold.black} ".colorize(:background => :white)
        elsif (i + j).odd?
          print " #{tile.to_s.bold.white } ".colorize(:background => :black)
        end
      end
      puts
    end
  end

  def make_move
    while true
      render
      @cursor.get_input
      system("clear")
    end

  end
end

if __FILE__ == $PROGRAM_NAME
  d = Display.new
  d.make_move
end
