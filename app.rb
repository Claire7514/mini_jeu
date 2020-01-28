require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
puts ""

puts "------------------------------"
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
player2.attacks(player1)
puts ""

puts "------------------------------"
puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
puts ""

puts "------------------------------"
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
player2.attacks(player1)
puts ""

puts "------------------------------"
puts "Voici l'état de nos joueurs :"
player1.show_state
player2.show_state
puts ""

puts "------------------------------"
puts "Passons à la phase d'attaque :"
player1.attacks(player2)
player2.attacks(player1)

binding.pry