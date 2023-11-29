class Student
  attr_reader :classroom, :age, :name

  def initialize(age, name = 'Unknown', parent_permission: true, classroom: 'Unknown')
    @age = age
    @name = name
    @parent_permission = parent_permission
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def display_info
    "[Student] name: #{name}, ID: #{object_id}, Age: #{age}"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) unless classroom.students.include?(self)
  end
end
