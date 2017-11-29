class Game
  attr_reader :board

  def initialize(board: Board.new, config:)
    @board = board
    @display = config.display
    @player_x = config.player_x
    @player_o = config.player_o
    @current_player = config.player_x
  end

  def start
    clear_screen
    print_board

    until over?
      play_single_turn
    end
    end_game
  end

  def reset
    self.board = Board.new
  end

  def play_single_turn
    display.announce_player_turn(current_player.mark)
    display.pick_move
    mark_board(valid_move)
    clear_screen
    tick_over
    print_board
  end

  def over?
    board.win? || board.tie?
  end

  private

  attr_reader :player_x, :player_o, :display, :current_player
  attr_writer :board

  def end_game
    if board.win?
      display.announce_win(board.winner)
    else
      display.announce_draw
    end
    display.goodbye
    exit
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
    loop do
      spot = current_player.pick_move(board)
      return spot if board.valid_move?(spot)
      display.invalid_move(spot)
    end
  end

  def mark_board(move)
    self.board = board.mark(move, current_player.mark)
  end
end
