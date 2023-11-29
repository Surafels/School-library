require './student'

describe Student do
  let(:classroom) { Classroom.new('English') }
  let(:student) { Student.new(18, 'Grammerly', parent_permission: true, classroom: classroom) }

  it 'should initialize correctly' do
    expect(student.age).to eq(18)
    expect(student.name).to eq('Grammerly')
    expect(student.classroom).to eq(classroom)
  end

  it 'should play hooky' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end

  it 'should display info' do
    expect(student.display_info).to include('[Student]')
    expect(student.display_info).to include('name: Grammerly')
    expect(student.display_info).to include('Age: 18')
  end

  it 'should have a default classroom' do
    student_without_classroom = Student.new(18, 'John Doe', parent_permission: true)
    expect(student_without_classroom.classroom).to eq('Unknown')
  end

  it 'should set a new classroom' do
    new_classroom = Classroom.new('Math')
    student.classroom = new_classroom
    expect(student.classroom).to eq(new_classroom)
  end

  it 'should add the student to the classroom' do
    new_classroom = Classroom.new('Math')
    student.classroom = new_classroom
    expect(new_classroom.students).to include(student)
  end

  it 'should not add the student if already in the classroom' do
    student.classroom = classroom
    expect(classroom.students.count).to eq(1)

    # Setting the same classroom again should not add the student again
    student.classroom = classroom
    expect(classroom.students.count).to eq(1)
  end
end
