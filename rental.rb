class Rental
  attr_accessor :date, :book, :person

  def initialize(person, book, date)
    @person = person
    @book = book
    @date = date

    book.rentals << self
    person.rentals << self
  end
end
