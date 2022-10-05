# Student class inherits from person
require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'unkwomn', parent_permission: true)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
