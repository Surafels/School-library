require_relative 'nameable'
class Person < Nameable
  attr_accessor :name, :age, :rentals

  def initialize(name: 'Unknown', age: 0, parent_permission: true, id: nil) # rubocop:disable Lint/UnusedMethodArgument
    super()
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @rentals = []
  end

  def add_rental(book, date)
    Rental.new(date, book, self)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end
