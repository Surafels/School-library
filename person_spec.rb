require_relative 'person'
require 'rspec'

RSpec.describe Person do
  let(:person) { Person.new(25, 'John Doe') }
  let(:book) { instance_double('Book', title: 'Title', author: 'Author') }

  describe '#can_use_services?' do
    context 'when the person is of age' do
      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is under age but has parental permission' do
      let(:person) { Person.new(16, 'Jane Doe', parent_permission: true) }

      it 'returns true' do
        expect(person.can_use_services?).to be(true)
      end
    end

    context 'when the person is under age and does not have parental permission' do
      let(:person) { Person.new(16, 'Jane Doe', parent_permission: false) }

      it 'returns false' do
        expect(person.can_use_services?).to be(false)
      end
    end
  end
end
