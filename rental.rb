class Rental
  attr_accessor :date, :person, :book

  def initialize(date, person, book)
    @date = date
    # belongs-to side of rental and person
    person.rentals << self
    @person = person
    # belongs-to side of rental and book
    book.rentals << self
    @book = book
  end
end
