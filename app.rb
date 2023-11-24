require_relative 'book'
require_relative 'person'
require_relative 'rental'
require_relative 'student'
require_relative 'teacher'


class App
  attr_reader :books, :person, rentals

  def initialize
    @book = []
    @person = []
    @rental = []
  end

  def list_all_books
    puts 'List of all Books:'
    @books.each { |book| puts "#{book.title} written by: #{book.author}" }
  end

  def list_all_people
    puts 'List of People:'
    @people.each do |person|
      if person.is_a?(Student)
      puts "[Student] Name:#{persone.name}, ID:#{person.id}, Age: #{person.age}"
      elsif person.is_a?(Teacher)
        puts "[Teacher] Name: #{persone.name}, ID:#{person.id}, Age: #{person.age}"
      else
        puts 'Invalid either student or teacher please'
    end
  end


  def create_a_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    if person_type != '1' && person_type != '2'
      puts 'Invalid option'
      return
    end
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    person =
      if person_type == '1'
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'
        Student.new(name: name, age: age, parent_permission: parent_permission)
      elsif person_type == '2'
        print 'Specialization: '
        specialization = gets.chomp
        Teacher.new(name: name, age: age, specialization: specialization)
      end

    @people << person
    puts 'Person created successfully'
  end

  def create_book
    puts 'Enter attributes for your book:'
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    book = Book.new(title, author)
    @books << book
    puts "Book '#{title}' by '#{author}' created."
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @books.each_with_index do |book, index|
      puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_index = gets.chomp.to_i
    puts "\nSelect a person from the following list by number (not id)"
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_index = gets.chomp.to_i
    print "\nDate: "
    date = gets.chomp
    @rentals << Rental.new(date, @books[book_index], @people[person_index])
    puts 'Rental created successfully'
  end

  def list_all_rentals
    list_all_people
    print 'Enter a person ID: '
    person_id = gets.chomp.to_i
    person = @people.find { |p| p.id == person_id }
    if person.nil?
      puts 'Person not found.'
      return
    end
    rentals = @rentals.select { |r| r.person == person }
    if rentals.empty?
      puts "#{person.name} has not done any rentals"
    else
      puts 'Rentals for:'
      rentals.each { |rental| puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" }
    end
  end
end
