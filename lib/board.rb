# frozen_string_literal: true

# => Check if there is a winner and if the game is on
# => Manage the state of boxes
# => Prints the board
class Board
	attr_accessor :board_array, :current_turn, :selection

	def initialize
		@current_turn = 1
		@selection = []
		@board_array = []

		3.times do |row|
			@board_array[row]=[]

			3.times do |col|
			@board_array[row][col] = BoardCase.new
			end
		end

		@selection[0]= 0
		@selection[1]= 0

		select_current
	end

	# Check if the game is over
	def is_over?
		return true if @current_turn == 10 || !who_won?.nil?
		return false
	end

	# Name of the winner
	# Returns TRUE if winner is circle
	# Return FALSE if winner is Cross
	# Return nill if no one still won on the board (check turn limit)
	def who_won?
		# Check the winning combinations (rows and columns)
		3.times do |n|
			if !@board_array[n][0].is_free? && !@board_array[n][1].is_free? && !@board_array[n][2].is_free?
				if (!@board_array[n][0].get_sign == !@board_array[n][1].get_sign) && (!@board_array[n][1].get_sign == !@board_array[n][2].get_sign)
					return @board_array[n][0].get_sign
				end
			end

			if !@board_array[0][n].is_free? && !@board_array[1][n].is_free? && !@board_array[2][n].is_free?
				if (!@board_array[0][n].get_sign == !@board_array[1][n].get_sign) && ( !@board_array[1][n].get_sign == !@board_array[2][n].get_sign )
					return @board_array[0][n].get_sign
				end
			end
		end

		# Check the winning combinations (diagonals)
		if !@board_array[0][0].is_free? && !@board_array[1][1].is_free? && !@board_array[2][2].is_free?
			if ( !@board_array[0][0].get_sign == !@board_array[1][1].get_sign ) && ( !@board_array[1][1].get_sign == !@board_array[2][2].get_sign )
				return @board_array[0][0].get_sign
			end
		end

		if !@board_array[0][2].is_free? && !@board_array[1][1].is_free? && !@board_array[2][0].is_free?
			if ( !@board_array[0][2].get_sign == !@board_array[1][1].get_sign ) && ( !@board_array[1][1].get_sign == !@board_array[2][0].get_sign )
				return @board_array[0][2].get_sign
			end
		end

		# Returns zero, if there are no winning combinations
		return nil
	end

	# Check the boxes
	def check_current_case (player)
		if @board_array[@selection[0]][@selection[1]].is_free?
			@board_array[@selection[0]][@selection[1]].check_case(player)
			@current_turn += 1
		end
	end

	# Prints the board line by line
	def print_board
		3.times do |row|
			5.times do |line|
				print "\t\t     "

				@board_array[row][0].print_case(line)
				@board_array[row][1].print_case(line)
				@board_array[row][2].print_case(line)

				puts ''
			end
		end
	end

	# CHANGE THE SELECTED BOX
	def change_selection(direction)
		return if direction < 0 || direction > 3
		# Up
		if direction == 0 
			# Check the top row
			if @selection[0] == 0 
				return

			else
				unselect_current
				@selection[0] -= 1
				select_current
				return
			end
		# Right
		elsif direction == 1
			# Check the right column
			if @selection[1] == 2
				return

			else
				unselect_current
				@selection[1] += 1
				select_current
			end
		# Down
		elsif direction == 2
			# Check bottom row
			if @selection[0] == 2
				return

			else
				unselect_current
				@selection[0] += 1
				select_current
			end
		# Left
		elsif direction == 3 
			# Check the left column
			if @selection[1] == 0
				return

			else
				unselect_current
				@selection[1] -= 1
				select_current
			end
		end
	end

	# Returns TRUE if player_circle is playing, otherwise FALSE
	def whos_turn_is_it?
		if @current_turn == 1 || @current_turn == 3 || @current_turn == 5 || @current_turn == 7 || @current_turn == 9
			return true
		else
			return false
		end
	end

	# Unselect the current box
	def unselect_current
		@board_array[@selection[0]][@selection[1]].unselect_case
	end

	# Select the current box
	def select_current
		@board_array[@selection[0]][@selection[1]].select_case
	end
end