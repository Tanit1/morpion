# frozen_string_literal: true

# Initialization and launch
class Game
	attr_accessor :player1, :player2, :application

	def initialize
		@player1 = Player.new("player1", true)
		@player2 = Player.new("player2", false)
	end

	def perform
		display_menu_user
		game_loop
		display_goodbye
	end

	private
	def game_loop
		user_input = 0
		display_game_menu

		while user_input < 1 || user_input > 5
			print "                   > "
			user_input = gets.to_i
		end

		case user_input
			when 1# launch game
				@application = Application.new(@player1, @player2)
				@application.perform
				game_loop
				return

			when 2#invert starting player
				@player1.circle_or_cross = !@player1.circle_or_cross
				@player2.circle_or_cross = !@player2.circle_or_cross
				game_loop
				return

			when 3#change player name
				display_menu_user
				game_loop
				return

			when 4#reset score
				@player1.score = 0
				@player2.score = 0
				game_loop
				return

			when 5#quit
				return

			else
				puts "Sélectionne l'une des options affichées"
				game_loop
			end
	end

	#menu de choix de nom pour les utilisateurs 
	def display_menu_user
		system 'clear'

		puts "\n\n\n\n\n\n\n\n\n"
		puts "                      Commençons !"
		puts "                      Entre le pseudo du Player 1"
		print "                      > "
		@player1.name = gets.chomp

		while(@player1.name =="") do
			puts "                      Ne me laisse pas avec un nom vide :("
			print "                      > "
			@player1.name = gets.chomp
		end

		puts "                      Maintenant, pseudo du Player 2"
		print "                      > "
		@player2.name = gets.chomp

		while(@player2.name =="") do
			puts "                      Ne me laisse pas avec un nom vide :("
			print "                      > "
			@player2.name = gets.chomp
		end

		puts 
		puts '                      Génial ! commençons le jeu :)'

		sleep(1)
	end

	def display_game_menu
		system "clear"

		puts "\n\n\n"
		puts "                        M E N U    P R I N C I P A L\n\n\n\n"
		puts "	 Player 1                              \t\tPlayer 2\n"
		puts "	 #{@player1.name}                      \t\t\t#{@player2.name}"
		print "  	 Jouer en tant que: "
		((@player1.circle_or_cross)? (print "Rouge".red) : (print "Bleu".blue))
		print "          \t\tJouer en tant que: "
		((@player2.circle_or_cross)? (puts "Rouge".red) : (puts "Bleu".blue)) 
		puts "	 #{@player1.score} victoires                       \t\t#{@player2.score} victoires \n\n\n"
		puts
		puts '                   1. Lancer le jeu'
		puts '                   2. Changer de couleur (Rouge commence)'
		puts '                   3. Changer le nom des joueurs'
		puts '                   4. Réinitialiser les scores'
		puts '                   5. Quitter'
	end 

	def display_goodbye
		system 'clear'

		puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tMerci d'avoir joué ! \n\n\t\t\t\t À bientôt\n\n\n\n".green
	end
end