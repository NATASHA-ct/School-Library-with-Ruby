# Decorator inherits from nameable
require_relative './nameable'

class Decorator < Nameable
   attr_accessor :nameable
  # constructor
  def initialize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
     @nameable.correct_name
  end
end
