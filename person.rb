class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, parent_permission: true, name: 'Unknown')
    @id = Random.rand(1...1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(30)
puts person.name
puts person.age

person.name = 'surafel'
person.age = 27
puts person.name
puts person.age
puts person.can_use_services?
