class Classroom
  attr_accessor :lable, :students

  def initialize(lable)
    @lable = lable
    @students = []
  end

  def add_student(student)
    students << student
    students.classroom = self
  end
end
