require './base_decorator'

class TrimmerDecorator < Decorator
  # method to make sure output of nameable is capitalized
  def correct_name
    @nameable.correct_name[0...10]
  end
end
