module Cli
  class Display
    def print_board(grid)
      puts " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]}"
    end

    def pick_player_for_mark(mark)
      puts "Choose player #{mark}: Human (1) or Computer (2)?"
    end

    def pick_move
      puts "Enter [1-9]:"
    end

    def invalid_move(spot)
      puts "#{spot} is an invalid move. Please enter a spot between 1-9 that is available on the board"
    end

    def announce_player_turn(player)
      puts "#{player}'s turn to play."
    end

    def announce_win(player)
      puts "#{player} wins!"
    end

    def announce_draw
      puts "Draw!"
    end

    def get_input
      gets.chomp
    end

    def clear_screen
      puts "\e[2J\e[f"
    end

    def title
      puts "#" * 50
      puts "TIC TAC TOE by Command Line Games Inc."
      puts "#" * 50
    end

    def play_again
      puts "Play again? Yes (1) or No (2)"
    end

    def goodbye
      puts "Goodbye!"
    end
  end
end
