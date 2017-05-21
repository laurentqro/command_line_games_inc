module Cli
  class Display
    def print_board(grid)
      puts " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]}"
    end

    def pick_player(number)
      puts "Player #{number} Human (1) or CPU (2)?"
    end

    def pick_mark_for(player)
      puts "Choose mark for Player #{player.number}. X (1) or O (2)?"
    end

    def announce_configuration(game)
      puts "#{game.player_1} plays with #{game.player_1.mark}."
      puts "#{game.player_2} plays with #{game.player_2.mark}."
      puts "#{game.current_player} will play first."
    end

    def pick_first_player
      puts "Who will play first?"
      puts "1. Player 1"
      puts "2. Player 2"
    end

    def announce_move(player, spot)
      puts "Player #{player.number} played #{player.mark} on spot #{spot}."
    end

    def pick_move
      puts "Enter [0-8]:"
    end

    def announce_player_turn(player)
      puts "Player #{player.number}'s turn to play."
    end

    def announce_win(player)
      puts "Player #{player.number} wins!"
    end

    def announce_draw
      puts "Draw!"
    end

    def get_input
      gets.chomp
    end
  end
end