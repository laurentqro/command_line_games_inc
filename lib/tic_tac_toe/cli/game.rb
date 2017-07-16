require 'tic_tac_toe/board'
require "tic_tac_toe/cli/display"
require "tic_tac_toe/human"
require "tic_tac_toe/computer"

module Cli
  class Game
    attr_reader :session
    attr_accessor :game

    def initialize(session:, game:)
      @session = session
      @game = game
    end

    def start
      display.clear_screen
      announce_setup
      print_board

      until game.is_over?
        display.announce_player_turn(current_player)
        spot = current_player.play(game.board)
        display.clear_screen
        display.announce_move(current_player, spot)
        print_board
        game.next_player
      end

      notify_game_over
      play_again
    end

    private

    def current_player
      game.current_player
    end

    def display
      Cli::Display.new
    end

    def announce_setup
      display.announce_setup(session)
    end

    def print_board
      display.print_board(game.board.grid)
    end

    def notify_game_over
      if game.board.win?
        winner = game.board.winner_is?(game.player_1.mark) ? game.player_1 : game.player_2
        display.announce_win(winner)
      else
        display.announce_draw
      end
    end

    def play_again
      display.play_again
      choice = display.get_input
      until valid?(choice)
        choice = validate(choice)
      end
      if choice == "1"
        self.game = ::Game.new(session: session)
        self.start
      else
        display.goodbye
        exit
      end
    end

    def valid?(choice)
      ["1", "2"].include?(choice)
    end

    def validate(choice)
      begin
        raise InvalidInputError.new(choice)
      rescue InvalidInputError => e
        puts e.message
        choice = display.get_input
      end
      choice
    end
  end
end
