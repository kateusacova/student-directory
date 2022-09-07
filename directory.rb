require 'bundler/setup'
require "csv"

@students = []

def interactive_menu
  loop do
    print_menu
    select_menu(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def select_menu(selection)
  puts "You selected option #{selection}"
  case selection
  when "1" 
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit 
  else 
    puts "I don't know what you meant, please try again"
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  @students.each.with_index(1) { |student, i|
    puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort)"
  }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  CSV.open(which_file, "wb") { |csv| 
    @students.each { |student| 
      csv << [student[:name], student[:cohort]]
    }
  }
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"

  name = STDIN.gets.chomp

  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end
end

def load_students(filename = which_file)
  CSV.foreach(filename) { |row| 
    name, cohort = row
    add_students(name, cohort)
  }
  puts "Loaded #{@students.count} students from #{filename}"
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first 
  if filename == nil
    load_students
  elsif File.exist?(filename)
    load_students(filename)
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def which_file 
  puts "Type the filename or hit return to use students.csv"
  file = STDIN.gets.chomp
  file == "" ? "students.csv" : file
end

try_load_students
interactive_menu