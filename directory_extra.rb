def input_students
  puts "Please enter the name, cohort and place of birth of the students"
  puts "To finish, just leave all fields blank"

  students =  []
  # asking for more information
  name = gets.chomp
  cohort = gets.chomp.to_sym
  country = gets.chomp

  while !name.empty? do
    students << {name: name, cohort: cohort, country: country}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp.to_sym
    country = gets.chomp
  end

  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each.with_index(1) { |student, i|
    puts "#{i}. #{student[:name]} from #{student[:country]} (#{student[:cohort]} cohort)"
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)




