class Person
  def initialize(id, age, parent_permission: true, name: 'Unknown')
    @id = id
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  attr_accessor :name, :age
  attr_reader :id


  def can_use_services?
    of_age? || @parent_permission
  end

  def of_age?
    @age >= 18
  end
end

person = Person.new(1, 30)
puts person.name
puts person.age

person.name = 'surafel'
person.age = 27
puts person.name
puts person.age

puts person.of_age?
puts person.can_use_services?
