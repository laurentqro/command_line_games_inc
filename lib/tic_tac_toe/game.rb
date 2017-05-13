require 'tic_tac_toe/board'
require "tic_tac_toe/display/cli"
require "tic_tac_toe/human"
require "tic_tac_toe/computer"

class Game
  attr_reader :board, :display, :player_1, :player_2, :current_player

  def initialize(board: Board.new, display: Display::Cli.new, player_1: Human.new, player_2: Computer.new, current_player:)
    @board = board
    @display = display
    @player_1 = player_1
    @player_2 = player_2
    @current_player = current_player
  end

  def start
    print_board
    until is_over?
      get_current_player_spot
      next_player
      print_board
    end
    notify_game_over
  end

  private

  def get_current_player_spot
    display.announce_player_turn(current_player)
    spot = nil

    until spot
      if current_player.is_a?(Human)
        prompt_player_input
        spot = display.get_input
      else
        spot = current_player.get_spot(board)
      end

      begin
        board.mark(spot, current_player.mark)
        display.announce_move(current_player, spot)
      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        print_board
        prompt_player_input
        spot = nil
      end
    end
  end

  def next_player
    current_player == player_1 ? @current_player = player_2 : @current_player = player_1
  end

  def is_over?
    board.win? || board.tie?
  end

  def prompt_player_input
    display.pick_move
  end

  def print_board
    display.print_board(board.grid)
  end

  def notify_game_over
    if board.win?
      display.announce_win(current_player)
    else
      display.announce_draw
    end
  end
end
