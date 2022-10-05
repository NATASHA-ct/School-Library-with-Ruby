#Decorator inherits from nameable
require_relative './nameable'

class Decorator < Nameable
    #constructor
  def initialize(nameable)
    super()
    @name = name
  end
end