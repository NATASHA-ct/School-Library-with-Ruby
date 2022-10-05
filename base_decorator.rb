# Decorator inherits from nameable
require_relative './nameable'

class Decorator < Nameable
  # constructor
  def initialize(nameable)
    super()
    @name = namemeable
  end

  def correct_name
    @nameable
  end
end
