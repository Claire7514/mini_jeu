require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

def menu
    puts "------------------------------------------------"
    puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
    puts "|Le but du jeu est d'être le dernier survivant !|"
    puts "------------------------------------------------"

    puts "Rentre ton petit prénom :"
    name = gets.chomp
    hplayer = HumanPlayer.new("#{name}")

    player1 = Player.new("Josiane")
    player2 = Player.new("José")
    enemy = []
    enemy << player1 << player2

    while player1.life_points !=0 || player2.life_points !=0 && hplayer.life_points !=0
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
        puts "0 - Josiane a #{player1.life_points} points de vie"
        puts "1 - José a #{player2.life_points} points de vie"
        puts "> "
        input = gets.chomp

        if input == "a"
            hplayer.search_weapon 
        elsif input == "s"
            hplayer.search_health_pack
        elsif input == "0"
            hplayer.attacks(player1) 
        else input == "1"
            hplayer.attacks(player2)
        end

        puts "------------------------------------------------"

        enemy.each do |player|
            if player.life_points > 0
              player.show_state
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
    if hplayer.life_points == 0 
        puts "Loser ! Tu as perdu !"
    else
        puts "BRAVO ! TU AS GAGNE !"
    end
end

menu

binding.pry