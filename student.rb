require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, parent_permission: true, name: 'Unknown')
    super(age, parent_permission: parent_permission, name: name)
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

student = Student.new(20, 'Classroom A')
puts student.name
puts student.age
puts student.classroom
puts student.can_use_services?
puts student.play_hooky
