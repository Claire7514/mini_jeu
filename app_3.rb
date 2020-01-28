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
    my_game = Game.new("#{name}")
end