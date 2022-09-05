def input_students
  puts "Please enter the name and cohort of the students"
  puts "To finish, just leave all fields blank"

  students =  []
  name = gets.chomp
  cohort = gets.chomp.to_sym
  
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    name = gets.chomp
    cohort = gets.chomp.to_sym
  end

  students
end
# using center() method to align the output
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print(students)
  students.each.with_index(1) { |student, i|
    puts "#{i}. #{student[:name]} (#{student[:cohort]} cohort)".center(50)
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

students = input_students
print_header
print(students)
print_footer(students)




