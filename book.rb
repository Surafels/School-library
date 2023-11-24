class Book
  attr_reader :title, :author
  attr_accessor :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def persons
    rentals.map(&:person)
  end
end
