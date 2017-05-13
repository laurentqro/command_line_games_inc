module Display
  class Cli
    def print(grid)
      puts " #{grid[0]} | #{grid[1]} | #{grid[2]} \n===+===+===\n #{grid[3]} | #{grid[4]} | #{grid[5]} \n===+===+===\n #{grid[6]} | #{grid[7]} | #{grid[8]} \n"
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
      puts "#" * 50
      puts "Who will make the first move?"
      puts "1. Player 1"
      puts "2. Player 2"
      puts "#" * 50
    end

    def announce_move(player, spot)
      puts "#" * 50
      puts "Player #{player.number} played #{player.mark} on spot #{spot}."
      puts "#" * 50
    end

    def pick_move
      puts "Enter [0-8]:"
    end

    def win(player)
      puts "Player #{player.number} wins!"
    end

    def draw
      puts "Draw!"
    end

    def get_input
      gets.chomp
    end
  end
end
