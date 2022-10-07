# Teacher class inherits from person
require_relative './person'

# Add class
class Teacher < Person
  # Adding a constructor
  def initialize(age, name, specialization = 'Unknown')
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
