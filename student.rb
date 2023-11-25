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
