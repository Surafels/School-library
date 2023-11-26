require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom: nil, age: 0, parent_permission: true, name: 'Unknown')
    super(age: age, parent_permission: parent_permission, name: name, id: rand(1...1000))
    @classroom = classroom
    classroom&.add_classroom(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def play_hooky
    '¯(ツ)/¯'
  end
end
