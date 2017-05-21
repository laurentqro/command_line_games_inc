require 'tic_tac_toe/board'
require "tic_tac_toe/cli/display"
require "tic_tac_toe/human"
require "tic_tac_toe/computer"

module Cli
  class Game
    attr_reader :display, :game

    def initialize(display: Cli::Display.new, game:)
      @display = display
      @game = game
    end

    def start
      print_board
      until game.is_over?
        get_current_player_spot
        game.next_player
        print_board
      end
      notify_game_over
    end

    private

    def get_current_player_spot
      display.announce_player_turn(game.current_player)
      spot = nil

      until spot
        if game.current_player.is_a?(Human)
          prompt_player_input
          spot = display.get_input
        else
          spot = game.current_player.get_spot(game.board)
        end

        begin
          game.board.mark(spot, game.current_player.mark)
          display.announce_move(game.current_player, spot)
        rescue IllegalMoveError, InvalidInputError => e
          puts e.message
          print_board
          prompt_player_input
          spot = nil
        end
      end
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
  end
end
