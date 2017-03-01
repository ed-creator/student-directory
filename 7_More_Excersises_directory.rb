require 'csv'

@students = []

def choose_filename
  puts "choose file"
  file = gets.chomp
  "puts you have chosen #{file}"
  return file
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def run_methods(selection)
  case selection
  when "1" then input_students
  when "2" then show_students
  when "3" then save_students(choose_filename)
  when "4" then puts load_students(choose_filename)
  when "9" then exit # this will cause the program to terminate
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    run_methods(STDIN.gets.chomp)
  end
end

def show_students
  print_header
  print_students_list(@students)
  print_footer(@students)
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    add_students(name)
    puts "Name added"
    puts "Now we have #{@students.count} students, add another name"
    name = STDIN.gets.chomp
  end
  puts "Input Succesful - Pick another option"
end

def add_students(names, cohorts = "november")
  @students << {name: names, cohort: cohorts.to_sym}
end

def save_students(filename = "students.csv")
  CSV.open(filename, "wb") do |csv|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv << student_data
      puts csv_line
    end
  end
  puts "Students Saved :) (see above)"
end

def load_students(filename = "students.csv")
  puts "New students loaded from #{filename}:"
  CSV.foreach(filename) do |row|
    add_students(row[0],row[1])
    puts "#{row[0]}, #{row[1]}"
  end
end

def try_load_students(filename = ARGV.first)
  if filename.nil?
    filename = "students.csv"
  end
  if File.exists?(filename)
      load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
  else
      puts "Sorry #{filename} doesn't exist"
      exit
  end
end

def print_header
  puts "The students of Villians Academy"
  puts "-------------"
end

def print_students_list(students)
  students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]}) cohort"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

try_load_students
interactive_menu()
