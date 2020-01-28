require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def menu
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------"

    puts "Rentre ton petit nom :"
    name = gets.chomp
    hplayer = HumanPlayer.new("#{name}")

    player1 = Player.new("Josiane")
    player2 = Player.new("José")
    enemy = []
    enemy << player1 << player2

    while hplayer.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
        puts "------------------------------------------------"
        puts "Voici l'état de ton joueur :"
        hplayer.show_state
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts ""
        puts "Attaquer un joueur en vue :"
        puts ""
        if player1.life_points > 0
            puts "0 - Josiane a #{player1.life_points} points de vie"
        end

        if player2.life_points > 0
            puts "1 - José a #{player2.life_points} points de vie"
        end
        puts "> "
        input = gets.chomp

        if input == "a"
            hplayer.search_weapon 
        elsif input == "s"
            hplayer.search_health_pack
        elsif input == "0"
            hplayer.attacks(player1)
            puts "#{hplayer.name} attacks #{player1.name}"
		    if player1.life_points > 0
			    player1.show_state
		    else
			    puts "#{player1.name} est mort"

		end
        else input == "1"
            hplayer.attacks(player2)
            puts "#{hplayer.name} attacks #{player2.name}"
		    if player2.life_points > 0
			    player2.show_state
		    else
			    puts "#{player2.name} est mort"
		end
        end

        puts "------------------------------------------------"

        puts "Les autres joueurs t'attaquent !"
        enemy.each do |player|
            if player.life_points > 0
              player.attacks(hplayer)
            end
        end
    end
    puts "La partie est finie"
    if hplayer.life_points <= 0 
        puts "Loser ! Tu as perdu !"
    elsif player1.life_points <= 0 && player2.life_points <= 0
        puts "BRAVO ! TU AS GAGNE !"
    end
end

menu

binding.pry