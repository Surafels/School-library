require_relative 'person'

class Teacher < Person
  def initialize(age:, specialization:, parent_permission: true, name: 'Unknown')
    super(age: age, parent_permission: parent_permission, name: name, id: rand(1...1000))
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
