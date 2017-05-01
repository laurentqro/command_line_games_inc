require 'tic_tac_toe/board'

class Game
  attr_reader :board

  def initialize(board: Board.new)
    @board = board
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def start_game
    print_board
    prompt_player_input

    until is_over?
      get_human_spot
      if !is_over?
        get_computer_spot
      end
      print_board
    end
    puts notify_game_over
  end

  def prompt_player_input
    puts "Enter [0-8]:"
  end

  def notify_game_over
    puts "Game over"
  end

  def get_human_spot
    spot = nil
    until spot
      spot = get_input
      if available_spaces.include?(spot.to_s)
        board.mark(spot, @hum)
      else
        spot = nil
      end
    end
  end

  def get_computer_spot
    spot = nil
    until spot
      if board.grid[4] == "4"
        spot = 4
        board.mark(spot, @com)
      else
        spot = get_best_move
        board.mark(spot, @com)
      end
    end
  end

  def get_best_move
    best_move = nil

    available_spaces.each do |as|
      board.mark(as.to_i, @com)
      # if can win with next move, play that
      if is_over?
        best_move = as.to_i
        board.mark(as.to_i, as, is_reset: true)
        return best_move
      else
        # block human winning with next move
        board.mark(as.to_i, as, is_reset: true)
        board.mark(as.to_i, @hum)
        if is_over?
          best_move = as.to_i
          board.mark(as.to_i, as, is_reset: true)
          return best_move
        else
          board.mark(as.to_i, as, is_reset: true)
        end
      end
    end

    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end

  private

  def is_over?
    board.win? || board.tie?
  end

  def get_input
    gets.chomp.to_i
  end

  def available_spaces
    board.available_spaces
  end

  def print_board
    board.print_grid
  end
end
