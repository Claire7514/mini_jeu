class Player
    attr_accessor :name, :life_points

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 10
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie"
    end

    def gets_damage(damage)
        @life_points = @life_points - damage
        if @life_points <= 0
            return "Le joueur #{@name} a été tué !" 
        end
    end

    def attacks(player)
        dam = compute_damage
        puts "Le joueur #{@name} attaque le joueur #{player.name}"
        player.gets_damage(dam)
        puts "Il lui inflige #{dam} points de dommages"
    end

    def compute_damage
        return rand(1..6)
    end
end

class HumanPlayer < Player
    attr_accessor :weapon_level

    def initialize(name_to_save)
        @name = name_to_save
        @life_points = 100
        @weapon_level = 1
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}."
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        weapon = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{weapon}."
        if weapon > @weapon_level
            puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
            @weapon_level = weapon
        else
            puts  "M@*#$... elle n'est pas mieux que ton arme actuelle..."
            @weapon_level = @weapon_level
        end
    end

    def search_health_pack
        life = rand(1..6)
        if life == 1
            puts "Tu n'as rien trouvé... "
        elsif life >= 2 && life <= 5
            puts "Bravo, tu as trouvé un pack de +50 points de vie !"
            @life_points = @life_points + 50
        else 
            puts "Waow, tu as trouvé un pack de +80 points de vie !"
            @life_points = @life_points + 80
        
        end
        if @life_points > 100
            ret = @life_points - 100 
            @life_points = @life_points - ret
        end
    end
end