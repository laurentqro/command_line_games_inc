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
    puts notify_game_over
  end

  def get_current_player_spot
    puts "#" * 50
    puts "#{current_player.name}'s turn to play."
    puts "#" * 50

    prompt_player_input if current_player.is_a?(Human)
    spot = nil
    until spot
      spot = current_player.get_spot(board)
      begin
        board.mark(spot, current_player.mark)
        puts "#" * 50
        puts "#{current_player.name} played #{current_player.mark} on spot #{spot}"
        puts "#" * 50
      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        print_board
        prompt_player_input if current_player.is_a?(Human)
        spot = nil
      end
    end
  end

  def next_player
    current_player == player_1 ? @current_player = player_2 : @current_player = player_1
  end

  private

  def is_over?
    board.win? || board.tie?
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
