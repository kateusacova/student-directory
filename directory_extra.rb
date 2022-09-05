def input_students
  puts "Please enter the name and cohort of the students"
  puts "To finish, just leave all fields blank"

  students =  []
  # refactored with parallel assignment
  # using alternative to chomp() method
  name, cohort = gets.delete_suffix("\n"), gets.delete_suffix("\n")
  
  while !name.empty? do
    # supplies a default value if cohort was not provided
    cohort = "September" if cohort.empty?
    students << {name: name, cohort: cohort.to_sym}
    # using singular or plural with ternary operator
    students.count == 1 ? (puts "Now we have #{students.count} student") :
    (puts "Now we have #{students.count} students")
    name, cohort = gets.delete_suffix("\n"), gets.delete_suffix("\n")
  end

  students
end
# using center() method to align the output
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

def print_by_cohort(students)
# printing students by groups
  groups = students.map { |st| st[:cohort] }.uniq
  groups.each { |group|
    puts "#{group} cohort:".center(50)
    students.each { |student| puts "#{student[:name]}".center(50) if group == student[:cohort] }
  }
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students".center(50)
end

def no_students
  puts "We don't have any students atm".center(50)
end

students = input_students
print_header
# doesn't print students if there are none
students.count == 0 ? no_students : 
(print_by_cohort(students)
print_footer(students))

