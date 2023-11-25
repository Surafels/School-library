require_relative 'app'

print '***************************************
*****Welcome to your school Library****
***************************************'

app = App.new

loop do
  # Display menu options
  puts "\nHere are your options:"
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'

  print 'Enter your choice selecting a number: '
  choice = gets.chomp.to_i

  # Execute the selected option
  case choice
  when 1
    app.list_all_books
  when 2
    app.list_all_people
  when 3
    app.create_a_person
  when 4
    app.create_book
  when 5
    app.create_rental
  when 6
    app.list_all_rentals
  when 7
    puts 'Exiting the app. Goodbye!'
    exit
  else
    puts 'Invalid choice. Please enter a number between 1 and 7.'
  end
end
