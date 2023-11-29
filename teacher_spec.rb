require_relative 'teacher'
require 'rspec'

RSpec.describe Teacher do
  let(:teacher) { Teacher.new(30, 'Mathematics', 'John Smith') }

  describe '#can_use_services' do
    it 'returns true' do
      expect(teacher.can_use_services).to be(true)
    end
  end
end
