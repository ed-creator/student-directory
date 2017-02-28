

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  months = ["March","November"]
  students = []
  name = gets.chomp
  puts "Cohort?"
  cohort = gets.chomp
    until months.include? cohort
      puts "Try again, the options are #{months}"
      cohort = gets.chomp
    end
  while !name.empty? do
    students << {name: name, cohort: cohort}
    puts "Now we have #{students.count} students"
    puts "Enter New Student"
    name = gets.chomp
      if !name.empty?
        puts "Cohort?"
        cohort = gets.chomp
        until months.include? cohort
          puts "Try again, the options are #{months}"
          cohort = gets.chomp
        end
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
    puts "#{student[:name]} (#{student[:cohort]}) cohort"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end


students = input_students
print_header
print(students)
print_footer(students)
