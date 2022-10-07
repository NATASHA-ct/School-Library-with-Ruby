#APP class inherits from all files
require './person'
require './student'
require './teacher'
require './rental'
require './book'
require './classroom'
require './nameable'
require './decorator'
require './capitalizedecorator'
require './trimmerdecorator'

class App
  attr_accessor :people, :book, :rental

  #methods for all required functionalities
    def list_all_books
    end

    def list_all_people
    end

    def create_a_person
    end

    def create_a_book
    end

    def create_a_rental
    end

    def list_all_rentals_id
    end

    def quit_app
    end
end


