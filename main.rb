require_relative 'app'

def welcome_message
  puts '***************************************'
  puts '*****Welcome to your school Library****'
  puts '***************************************'
end

def display_options
  # Display menu options
  puts "\nPlease choose on of the following options to proceed:"
  puts "\nHere are your options:"
  puts '***************************************'
  puts '1. List all books'
  puts '2. List all people'
  puts '3. Create a person'
  puts '4. Create a book'
  puts '5. Create a rental'
  puts '6. List rentals for a person'
  puts '7. Quit'
  puts '***************************************'
end

def user_choice
  print 'Enter your choice selecting a number: '
  gets.chomp.to_i
end

def execute_choice(app, choice)
  choices = {
    1 => :execute_list_all_books,
    2 => :execute_list_all_people,
    3 => :execute_create_person,
    4 => :execute_create_book,
    5 => :execute_create_rental,
    6 => :execute_list_all_rentals,
    7 => :execute_quit
  }

  if choices.key?(choice)
    send(choices[choice], app)
  else
    puts 'Invalid choice. Please enter a number between 1 and 7.'
  end
end

def execute_list_all_books(app)
  app.list_all_books
end

def execute_list_all_people(app)
  app.list_all_people
end

def execute_create_person(app)
  app.create_a_person
end

def execute_create_book(app)
  app.create_book
end

def execute_create_rental(app)
  app.create_rental
end

def execute_list_all_rentals(app)
  app.list_all_rentals
end

def execute_quit(_app)
  puts 'Exiting the app. Goodbye!'
  exit
end

def run_app(app)
  loop do
    display_options
    choice = user_choice
    execute_choice(app, choice)
  end
end

welcome_message
app = App.new
run_app(app)
