require_relative 'player'

class game
    attr_accessor :HumanPlayer, :enemies

    def initialize(name_to_save)
        @human_player = name_to_save
        hplayer = Player.new("Wolverine")
        @enemies = []
        player1 = Player.new("Josiane")
        player2 = Player.new("José")
        player3 = Player.new("Jule")
        player4 = Player.new("Julio")
        @enemies << player1 << player2 << player3 << player4
    end

    def kill_player(player)
        @enemies.delete(player)
    end

    def is_still_ongoing? 
        if (hplayer.life_points > 0) == false || (enemies.life_points == 0) > false
            return false
        else
            return true
        end
    end

    def show_players
        puts "Voici l'état de ton joueur :"
        hplayer.show_state
        puts "Voici le nombre de joueurs bots restant :"
        puts "#{@enemies.count}"
    end

    def menu
        puts "------------------------------------------------"
        puts "Voici l'état de ton joueur :"
        hplayer.show_state
        puts "Quelle action veux-tu effectuer ?"
        puts ""
        puts "a - chercher une meilleure arme"
        puts "s - chercher à se soigner "
        puts "> "
        input1 = gets.chomp
        puts ""
        puts "Attaquer un joueur en vue :"
        puts ""
        i = 0
        while i <= @enemies.count
            enemies.each do |player|
                if player.life_points > 0
                    puts "#{i} - Josiane a #{player.life_points} points de vie"
                end
            end
            i += 1
        end
        puts "> "
        input2 = gets.chomp
    end

    def menu_choice
        if input1 == "a"
            hplayer.search_weapon 
        else
            hplayer.search_health_pack
        end

        if input2 == "0"
            hplayer.attacks(player1) 
        else
            hplayer.attacks(player2)
        end
        enemy.each do |player|
            if player.life_points == 0
              player.kill_player(player)
            end
        end
    end

    def enemies_attack
        enemy.each do |player|
            if player.life_points > 0
              player.attacks(hplayer)
            end
        end
    end

    def end
        fin = is_still_ongoing?
        if fin = false
            puts "La partie est finie"
            if hplayer.life_points == 0 
                puts "Loser ! Tu as perdu !"
            else
                puts "BRAVO ! TU AS GAGNE !"
            end
        end
    end
end