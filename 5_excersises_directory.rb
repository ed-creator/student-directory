def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  puts "What are their hobbies?"
  hobbies = gets.chomp
  puts "Nationality?"
  nationality = gets.chomp
  puts "Height? (in Meters)"
  height = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, hobbies: hobbies, nationality: nationality, height: height}
    puts "Now we have #{students.count} students"
    puts "Enter next student"
    name = gets.chomp
    if !name.empty?
      puts "What are their hobbies?"
      hobbies = gets.chomp
      puts "Nationality?"
      nationality = gets.chomp
      puts "Height? (in Meters)"
      height = gets.chomp
    end
  end
  students
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}) cohort./n Their hobbies include #{student[:hobbies]}, They are #{student[:nationality]} and they are #{student[:height]} meters tall"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
