def now_we_have(n)
  if n == 1
    puts "Now we have #{n} student"
  elsif n > 1
    puts "Now we have #{n} students"
  end
end



def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    now_we_have(students.count)
    name = gets.chomp
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
