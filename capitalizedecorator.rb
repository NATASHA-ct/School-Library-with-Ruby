require './base_decorator'

class CapitalizeDecorator < Decorator
  # method to make sure output of nameable is capitalized
  def correct_name
    @nameable.correct_name.capitalize
  end
end
