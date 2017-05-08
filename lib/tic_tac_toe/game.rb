require 'tic_tac_toe/board'
require 'tic_tac_toe/display/cli'

class Game
  attr_reader :board, :display

  def initialize(board: Board.new, display: Display::Cli.new)
    @board = board
    @display = display
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

  def get_human_spot
    spot = nil
    until spot
      spot = get_input
      begin
        board.mark(spot, @hum)
      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        print_board
        prompt_player_input
        spot = nil
      end
    end
  end

  def get_computer_spot
    spot = nil
    until spot
      if board.grid[4] == "4"
        spot = "4"
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
      board.mark(as, @com)
      # if can win with next move, play that
      if is_over?
        best_move = as
        board.mark(as, as, is_reset: true)
        return best_move
      else
        # block human winning with next move
        board.mark(as, as, is_reset: true)
        board.mark(as, @hum)
        if is_over?
          best_move = as
          board.mark(as, as, is_reset: true)
          return best_move
        else
          board.mark(as, as, is_reset: true)
        end
      end
    end

    n = rand(0..available_spaces.count)
    return available_spaces[n]
  end

  private

  def is_over?
    board.win? || board.tie?
  end

  def get_input
    gets.chomp
  end

  def available_spaces
    board.available_spaces
  end

  def prompt_player_input
    puts "Enter [0-8]:"
  end

  def print_board
    display.print(board.grid)
  end

  def notify_game_over
    puts "Game over"
  end
end
