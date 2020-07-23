# frozen_string_literal: true

# Check the state of the boxes:
# => Empty
# => Selected by the player
# Circle or cross boolean :
# => CIRCLE is TRUE
# => CROSS is FALSE
class BoardCase
	attr_accessor :circle_or_cross, :selected, :case_checked

	def initialize
		@selected = false
		@case_checked = false
		@circle_or_cross = false
	end

	# If the case is checked, returns the state (circle or cross)
	def get_sign
		return circle_or_cross if case_checked
		puts 'Cette case est déjà cochée.'
	end

	# Checks the box with the player sign
	def check_case (player)
		@case_checked = true
		@circle_or_cross = player.circle_or_cross
	end

	# Prints line by line the box
	def print_case(line)
		if !selected
			# The box isnt checked
			if !@case_checked
				print "╔═════════╗" if line == 0
				print "║         ║" if line == 1
				print "║         ║" if line == 2
				print "║         ║" if line == 3
				print "╚═════════╝" if line == 4

			# The box is checked and the symbol is a circle
			elsif circle_or_cross
				print "╔═════════╗" 										if line == 0
				print "║    "+"■".red+"    ║" 					if line == 1
				print "║  "+"■".red+"   "+"■".red+"  ║" if line == 2
				print "║    "+"■".red+"    ║" 					if line == 3
				print "╚═════════╝" 										if line == 4

			# The box is checked and the symbol is a cross
			else
				print "╔═════════╗" 																	if line == 0
				print "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" if line == 1
				print "║    "+"■".light_blue+"    ║" 									if line == 2
				print "║  "+"■".light_blue+"   "+"■".light_blue+"  ║" if line == 3
				print "╚═════════╝" 																	if line == 4
			end

		# The user is selecting this box
		else
			# The box isnt checked
			if !@case_checked
				print "╔═════════╗".green if line == 0
				print "║         ║".green if line == 1
				print "║         ║".green if line == 2
				print "║         ║".green if line == 3
				print "╚═════════╝".green if line == 4

			# The box is checked and the symbol is a circle
			elsif circle_or_cross
				print "╔═════════╗".green														if line == 0
				print "║    ".green+"■".red+"    ║".green 					if line == 1
				print "║  ".green+"■".red+"   "+"■".red+"  ║".green if line == 2
				print "║    ".green+"■".red+"    ║".green 					if line == 3
				print "╚═════════╝" .green													if line == 4

			# The box is checked and the symbol is a cross
			else
				print "╔═════════╗".green																					if line == 0
				print "║  ".green+"■".light_blue+"   "+"■".light_blue+"  ║".green if line == 1
				print "║    ".green+"■".light_blue+"    ║".green 									if line == 2
				print "║  ".green+"■".light_blue+"   "+"■".light_blue+"  ║".green if line == 3
				print "╚═════════╝".green																					if line == 4
			end
		end
	end

	# Check the box as selected by the user
	def select_case
		@selected = true
	end

	# Uncheck the box
	def unselect_case
		@selected = false
	end

	# Return TRUE if the box has not been checked by a player
	def is_free?
		return !case_checked
	end
end