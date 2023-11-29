require './person'
require './book'
require 'rspec'

RSpec.describe Person do
  let(:person) { Person.new(25, 'John Doe') }
  let(:book) { Book.new('Title', 'Author') } # Use an actual instance of Book

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

  describe '#add_rental' do
    it 'adds a rental to the person' do
      date = '2023-11-28' # Assuming '2023-11-28' is a valid date
      person.add_rental(book, date)

      expect(person.rentals).not_to be_empty
      expect(person.rentals.first.book).to eq(book)
      expect(person.rentals.first.date).to eq(date)
      expect(person.rentals.first.person).to eq(person)

      # Ensure the book's rentals include the new rental
      expect(book.rentals).to include(person.rentals.first)
    end
  end

  describe '#correct_name' do
    it 'corrects the name to uppercase' do
      person.correct_name
      expect(person.name).to eq('JOHN DOE')
    end
  end
end
