# frozen_string_literal: true

# The characteristics of a player are:
# => Name
# => Selected circle_or_cross
# => Color according to circle_or_cross
# => Score
class Player
  attr_accessor :name, :circle_or_cross, :score

  def initialize(name, circle_or_cross)
    @name = name
    @circle_or_cross = circle_or_cross
    @score = 0
  end
end
