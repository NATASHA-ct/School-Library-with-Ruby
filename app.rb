# APP class inherits from all files
require './person'
require './student'
require './teacher'
require './rental'
require './book'
require './classroom'
require './base_decorator'
require './nameable'
require './capitalizedecorator'
require './trimmerdecorator'
require './main_menu'

class App < Menu
  attr_accessor :people, :book, :rentals, :student, :person

  # App constructors
  def initialize
    @people = []
    @books = []
    @book = nil
    @teacher =[]
    @rentals = []
    @person = nil
    super
  end

  def display(choice)
    case choice
    when 1 then list_all_books
    when 2 then list_all_people
    when 6 then list_all_rentals_id
    when 7 then quit_app
    end
  end

  def add(choice)
    case choice
    when 3 then create_a_person
    when 4 then create_a_book
    when 5 then create_a_rental
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

  # methods for all required functionalities
  def list_all_books
    if @books.length.zero?
      puts 'You don\'t have any books'
    else
      @books.each_with_index do |bk, index|
        puts "#{index}) Title: #{bk.title}, Author: #{bk.author}"
      end
    end
  end

  def list_all_people
    if @people.length.zero?
      puts 'No person yet!You need at least one person'
    else
      @people.map.each_with_index do |person, index|
        puts "#{index}) [#{person.classroom}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
      end
    end
  end

  def create_student
    puts 'Great! let\'s create the student!'
    print 'Student age: '
    stdage = gets.chomp.to_i
    print 'Student name: '
    stdname = gets.chomp
    print 'Student class: '
    std_class = gets.chomp
    print 'Parent permission? true/ false: '
    stdparpermission = gets.chomp
    case stdparpermission
    when 'true'
      @people.push(Student.new(stdage, std_class, stdname, true))
    when 'false'
      @people.push(Student.new(stdage, std_class, stdname, false))
    else
      puts 'That was an invalid entry'
    end

    puts 'Student is created successfully'
  end

  def create_a_person
    print 'Hello! Would you like to create a:
        1. Student
        2. Teacher
        Choose between the two: '
    choice = gets.chomp.to_i

    case choice
    when 1
      create_student

    when 2
      puts 'Great! let\'s create the Teacher!'
      print 'Teacher age: '
      teacher_age = gets.chomp.to_i
      print 'Teacher name: '
      teacher_name = gets.chomp
      print 'Teacher specialization: '
      teacher_specs = gets.chomp
      teacher_permission = true
      @people.push(Teacher.new(teacher_age, teacher_name, teacher_specs, 'junior', teacher_permission))
      puts 'Teacher is created successfully'
    end
  end

  def create_a_book
    print 'Splendid! we love new books.
        Enter the book title: '
    book_title = gets.chomp
    print 'Enter the book\'s author: '
    book_author = gets.chomp
    @books.push(Book.new(book_title, book_author))
    puts 'Book was added succesfully!'
  end

  def create_a_rental
    if @books.empty? && @people.empty?
      puts 'Huh, nothing to see here'
    else
      puts 'Select the id of the book you want: '
      @books.each_with_index do |book, index|
        puts "#{index + 1}) Title: \"#{book.title}\" Author: #{book.author}"
      end
      number = gets.chomp.to_i
      index = number - 1

      puts 'Type your ID: '
      @people.each { |person| puts "[#{person.class}] Name: #{person.name} | Age: #{person.age} | ID: #{person.id}" }
      identity = gets.chomp.to_i

      individual = @people.select { |person| person.id == identity }.first

      print 'Enter date of renting the book:(yyyy-mm-dd) '
      date = gets.chomp.to_s
      rent = Rental.new(individual, date, @books[index])
      @rentals << rent

      puts 'Book rented successfully'
    end
  end

  def list_all_rentals_id
    puts 'There are no rentals available at the moment' if @rentals.empty?
    print 'Wonderful! let\'s find your book!\n, Type your ID: '
    id = gets.chomp.to_i
    rental = @rentals.select { |rent| rent.person.id == id }
    if rental.empty?
      puts 'Sorry there are no records for that ID'
    else
      puts 'Here are your records: '
      puts ''
      rental.each_with_index do |record, index|
        puts "#{index + 1}) Date: #{record.date} Borrower: #{record.person.name}
            Status: #{record.person.class} Borrowed book: \"#{record.book.title}\" by #{record.book.author}"
      end
    end
  end

  def quit_app
    puts 'Thank you for using my app!'
    exit(true)
  end
end
