module Slidable

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves_arr = []
    move_dirs.each { |move| moves_arr += grow_unblocked_moves_in_dir(move) }
    moves_arr
  end

  private

  def move_dirs # helper method to moves

  end

  def grow_unblocked_moves_in_dir(dx, dy)
    moves_arr = []
    # [dx, dy] => [1, 1], []
    count = 1
    blocked = false
    until blocked
      temp = dx, dy
      temp =  temp.first * count, temp.last * count
      next_pos = self.first + temp.first, self.last + temp.last
      if @board.valid_pos?(next_pos) && @board[next_pos].color != self.color &&
          !@board[next_pos].is_a? NullPiece
        moves_arr << temp
        blocked = true
      elsif @board.valid_pos?(next_pos) && @board[next_pos].color == self.color
        blocked = true
      elsif !@board.valid_pos?(next_pos)
        blocked = true
      end
      count += 1
    end
    moves_arr

      # Four conditions:
        # 1. if piece at next_pos is NullPiece, save temp_move as move, increment count
        # 2. if piece at next_pos is same_color piece, blocked = true
        # 3. if piece at next_pos is diff_color piece, save temp_move as move, blocked = true
        # 4. if next_pos is not valid, blocked = true



  end



  HORIZONTAL_DIRS = [[0, -1], [-1. 0], [0, 1], [1, 0]]
  DIAGONAL_DIRS = [[-1, -1], [-1, 1], [1, -1], [1, 1]]

end
