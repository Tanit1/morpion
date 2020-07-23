# frozen_string_literal: true

# This class handles game loops and the Board Object
# => Handles the game loop and the user inputs
# => Process the end game state : Draw or Win
class Application
  attr_accessor :player1, :player2, :game_board, :user_exit

  def initialize (player1, player2)
    @player1 = player1
    @player2 = player2
    @game_board = Board.new
    @user_exit = false
  end

  # Game loop
  def perform
    while !@game_board.is_over? && !@user_exit do
      system 'clear'
      puts "\n\n"
      puts "\tLes règles sont simples : "
      puts "\tSélectionne un carré avec les flèches et coche-le en appuyant sur 'p'"
      puts "\n\n"
			print_board
			
      if @game_board.whos_turn_is_it? == @player1.circle_or_cross
        print "\n\tC'est au tour de #{@player1.name} de jouer ! joueur "
        # Selon la forme du joueur, couleur rouge ou verte (condition ternaire)
				( (@player1.circle_or_cross) ? (print 'Rouge'.red) : (print 'Bleu'.blue) )

      else
        print "\n\tC'est au tour de #{@player2.name} de jouer ! joueur "
        # Selon la forme du joueur, couleur rouge ou verte (condition ternaire)
        ( (@player2.circle_or_cross) ? (print 'Rouge'.red) : (print 'Bleu'.blue) )
			end

      puts
			puts "\tTu peux retourner au menu principal en appuyant sur 'q'"

      process_action(read_char)
    end
    display_match_result
  end

  # Determine the outcome of the game
  def display_match_result
    system 'clear'

    tmp = @game_board.who_won?

    if tmp.nil?
      return
    end

    match_won(tmp)
  end

	# Poster winner
	def match_won(tmp)
		if(@player1.circle_or_cross == tmp)
			@player1.score +=1
			puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tJoueur #{@player1.name} gagne!".green
		else
			@player2.score +=1
			puts "\n\n\n\n\n\n\n\n\n\n\n\n\t\t\t\tJoueur #{@player2.name} gagne!".green
		end
		sleep(1)
	end

	# Processes user actions
	def process_action(input)
		case input
		# Check a box
		when "p"
			if @game_board.whos_turn_is_it? == @player1.circle_or_cross
				@game_board.check_current_case(@player1)

			elsif @game_board.whos_turn_is_it? == @player2.circle_or_cross
				@game_board.check_current_case(@player2)
			end
		# Up
		when "\e[A"
			@game_board.change_selection(0)
		# Down
		when "\e[B"
			@game_board.change_selection(2)
		# Right
		when "\e[C"
			@game_board.change_selection(1)
		# Left
		when "\e[D"
			@game_board.change_selection(3)
		# Quit
		when "q"
			@user_exit = true
		end
	end

	# Get the arrow keys
	def read_char
		STDIN.echo = false
		STDIN.raw!

		input = STDIN.getc.chr

		if input == "\e" then
			input << STDIN.read_nonblock(3) rescue nil
			input << STDIN.read_nonblock(2) rescue nil
		end

	ensure
		STDIN.echo = true
		STDIN.cooked!

		return input
	end

	# Prints the game board
	def print_board
		@game_board.print_board
	end
end
