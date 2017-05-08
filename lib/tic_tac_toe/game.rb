require 'tic_tac_toe/board'
require "tic_tac_toe/display/cli"
require "tic_tac_toe/human"
require "tic_tac_toe/computer"

class Game
  attr_reader :board, :display, :player_1, :player_2

  def initialize(board: Board.new, display: Display::Cli.new, player_1: Human.new, player_2: Computer.new)
    @board = board
    @display = display
    @player_1 = player_1
    @player_2 = player_2
  end

  def start
    print_board

    until is_over?
      get_player_1_spot
      if !is_over?
        get_player_2_spot
      end
      print_board
    end
    puts notify_game_over
  end

  def get_player_1_spot
    puts "#" * 50
    puts "#{player_1.class.name}'s turn to play."
    puts "#" * 50

    prompt_player_input if player_1.is_human?
    spot = nil
    until spot
      spot = player_1.get_spot(board, opponent: player_2)
      begin
        board.mark(spot, player_1.mark)
        puts "#" * 50
        puts "#{player_1.class.name} played #{player_1.mark} on spot #{spot}"
        puts "#" * 50

      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        print_board
        prompt_player_input if player_1.is_human?
        spot = nil
      end
    end
  end

  def get_player_2_spot
    puts "#" * 50
    puts "#{player_2.class.name}'s turn to play."
    puts "#" * 50

    prompt_player_input if player_2.is_human?
    spot = nil
    until spot
      spot = player_2.get_spot(board, opponent: player_1)
      begin
        board.mark(spot, player_2.mark)
        puts "#" * 50
        puts "#{player_2.class.name} played #{player_2.mark} on spot #{spot}"
        puts "#" * 50

      rescue IllegalMoveError, InvalidInputError => e
        puts e.message
        print_board
        prompt_player_input if player_2.is_human?
        spot = nil
      end
    end
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
