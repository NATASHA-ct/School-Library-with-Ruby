#Decorator inherits from nameable
require_relative './nameable'

class Decorator < Nameable
    #constructor
  def initialize(nameable)
    super()
    @name = name
  end

  def correct_name
    @nameable
  end
end