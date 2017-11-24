require 'tic_tac_toe/board'

class Game
  attr_reader :board

  def initialize(board: Board.new, display:, config:)
    @board = board
    @display = display
    @player_x = config.player_x
    @player_o = config.player_o
    @current_player = config.player_x
  end

  def start
    clear_screen
    print_board

    until game_over?
      play
    end
    end_game
  end

  private

  attr_reader :player_x, :player_o, :display, :current_player
  attr_writer :board

  def game_over?
    board.win? || board.tie?
  end

  def play
    display.announce_player_turn(current_player.mark)
    display.pick_move
    mark_board(valid_move)
    clear_screen
    tick_over
    print_board
  end

  def end_game
    notify_game_over
    play_again
  end

  def clear_screen
    display.clear_screen
  end

  def print_board
    display.print_board(board.grid)
  end

  def tick_over
    @current_player = next_player
  end

  def next_player
    @current_player == player_x ? player_o : player_x
  end

  def valid_move
    current_player.pick_move(board)
  end

  def mark_board(move)
    self.board = board.mark(move, current_player.mark)
  end

  def notify_game_over
    if board.win?
      display.announce_win(board.winner)
    else
      display.announce_draw
    end
  end

  def play_again
    display.play_again
    choice = display.get_input

    if choice == "1"
      self.board = Board.new
      start
    else
      display.goodbye
      exit
    end
  end
end
