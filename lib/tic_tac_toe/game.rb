class Game
  attr_reader :board

  def initialize(board: ["0", "1", "2", "3", "4", "5", "6", "7", "8"])
    @board = board
    @com = "X" # the computer's marker
    @hum = "O" # the user's marker
  end

  def start_game
    print_board
    prompt_player_input

    until game_is_over(@board) || tie(@board)
      get_human_spot
      if !game_is_over(@board) && !tie(@board)
        get_computer_spot
      end
      print_board
    end
    puts notify_game_over
  end

  def print_board
    # start by printing the board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} \n===+===+===\n #{@board[3]} | #{@board[4]} | #{@board[5]} \n===+===+===\n #{@board[6]} | #{@board[7]} | #{@board[8]} \n"
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
      if @board[spot] != "X" && @board[spot] != "O"
        @board[spot] = @hum
      else
        spot = nil
      end
    end
  end

  def get_computer_spot
    spot = nil
    until spot
      if @board[4] == "4"
        spot = 4
        @board[spot] = @com
      else
        spot = get_best_move(@board)
        if @board[spot] != "X" && @board[spot] != "O"
          @board[spot] = @com
        else
          spot = nil
        end
      end
    end
  end

  def get_best_move(board, depth = 0, best_score = {})
    best_move = nil

    available_spaces.each do |as|
      board[as.to_i] = @com
      # if can win with next move, play that
      if game_is_over(board)
        best_move = as.to_i
        board[as.to_i] = as
        return best_move
      else
        # block human winning with next move
        board[as.to_i] = @hum
        if game_is_over(board)
          best_move = as.to_i
          board[as.to_i] = as
          return best_move
        else
          board[as.to_i] = as
        end
      end
    end

    n = rand(0..available_spaces.count)
    return available_spaces[n].to_i
  end

  def game_is_over(b)
    [b[0], b[1], b[2]].uniq.length == 1 ||
    [b[3], b[4], b[5]].uniq.length == 1 ||
    [b[6], b[7], b[8]].uniq.length == 1 ||
    [b[0], b[3], b[6]].uniq.length == 1 ||
    [b[1], b[4], b[7]].uniq.length == 1 ||
    [b[2], b[5], b[8]].uniq.length == 1 ||
    [b[0], b[4], b[8]].uniq.length == 1 ||
    [b[2], b[4], b[6]].uniq.length == 1
  end

  def tie(b)
    b.all? { |s| s == "X" || s == "O" }
  end

  private

  def get_input
    gets.chomp.to_i
  end

  def available_spaces
    board.select { |space| space != "X" && space != "O" }
  end
end
