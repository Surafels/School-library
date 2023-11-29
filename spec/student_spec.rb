require './student'

describe Student do
  let(:student) { Student.new(18, 'Grammerly', parent_permission: true, classroom: 'English') }

  it 'should initialize correctly' do
    expect(student.age).to eq(18)
    expect(student.name).to eq('Grammerly')
    expect(student.classroom).to eq('English')
  end

  it 'should play hooky' do
    expect(student.play_hooky).to eq('¯\(ツ)/¯')
  end

  it 'should display info' do
    expect(student.display_info).to include('[Student]')
    expect(student.display_info).to include('name: Grammerly')
    expect(student.display_info).to include('Age: 18')
  end
end
