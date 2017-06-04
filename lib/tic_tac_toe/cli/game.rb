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
        get_current_player_spot
        print_board
        game.next_player
      end
      notify_game_over
      play_again
    end

    private

    def display
      Cli::Display.new
    end

    def get_current_player_spot
      display.announce_player_turn(game.current_player)
      spot = nil

      until spot
        if game.current_player.is_a?(Human)
          prompt_player_input
          spot = display.get_input
        else
          sleep 3
          spot = game.current_player.get_spot(game.board)
        end

        begin
          game.board.mark(spot, game.current_player.mark)
          display.clear_screen
          display.announce_move(game.current_player, spot)
        rescue IllegalMoveError, InvalidInputError => e
          puts e.message
          spot = nil
        end
      end
    end

    def announce_setup
      display.announce_setup(session)
    end

    def prompt_player_input
      display.pick_move
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
      if choice == "1"
        self.game = ::Game.new(session: session)
        self.start
      else
        display.goodbye
        exit
      end
    end
  end
end
