require_relative './app'
@method = App.new

# Main menu
def print_menu
  print 'Welcome to my Library! You may perform the following tasks:
  1. List all books.
  2. List all people
  3. Create a person
  4. Create a book.
  5. Create a rental
  6. List all rentals for a given person id.
  7. Exit
  Choose (1-7): '
end

# Get input from the user
def user_choice
  gets.chomp.to_i
end

def display(choice)
  case choice
  when 1
    @method.list_all_books
  when 2
    @method.list_all_people
  when 6
    @method.list_all_rentals_id
  when 7
    @method.quit_app
  end
end

def add(choice)
  case choice
  when 3
    @method.create_a_person
  when 4
    @method.create_a_book
  when 5
    @method.create_a_rental
  end
end

def main(status)
  loop do
    break unless status

    print_menu
    user_input = user_choice
    display(user_input)
    add(user_input)
  end
end

main(true)
main.main
