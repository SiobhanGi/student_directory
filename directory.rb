#name, cohort, hobbies, height input seperated into different methods
@students = []

# INPUT METHODS

def message(field)
  puts "Enter the students #{name}"
  field = STDIN.gets.chop.capitalize
  return field
end

def input_students
  name, cohort, age, height, gender = message("name"), message("cohort"), message("age"), message("height"), message("gender")
  while !name.empty?
  @current_student = {name: name.to_sym,
                    cohort: cohort.to_sym,
                    age: age,
                    height: height,
                    gender: gender.to_sym}.reject {|k, v| v.empty?}

  #  check details are correct, if they are push to array
  @current_student.each {|k, v| puts "#{k}: #{v}" }
  puts "\nAre these details correct? type 'yes' or 'no'"
  @students << @current_student if STDIN.gets.chomp.downcase.chr == "y"
  puts current_student_count
  name = message("name")
  end
end

def current_student_count#prints out count
  puts @students.size <= 1 ? "Now we have #{@students.count} student." : "Now we have #{@students.count} students."
end

def specific_students
  puts "Enter the first letter of the names you want to print"
  specific_letter = STDIN.gets.chop.upcase
end

# PRINT METHODS

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  i = 0
  if @students.size >= 1
    @students.map {|student| student[:cohort]}.uniq.each do |cohort|
      puts ""
      puts "#{cohort} cohort".center(40)
      @students.each do |student|
        if student[:cohort] == cohort
            puts ""
            puts ("#{(i+1)}. #{@students[i][:name]}").center(40)
            puts ("age: #{@students[i][:age]}").center(40)
            puts ("height: #{@students[i][:height]}").center(40)
            puts ("gender: #{@students[i][:gender]}").center(40)
            i+=1
        end
      end
    end
  end
end

def print_footer
    puts "\nOverall, we have #{@students.count} great students."
end

def show_students
  print_header
  print_students_list
  print_footer
end

# PROGRAM MENU

def print_menu
  puts "\nWhat would you like to do? Type the option number\n\n"
  puts "Option 1: Add students."
  puts "Option 2: Show current students."
  puts "Option 3: Save students to csv file."
  puts "Option 4: Load students from csv file."
  puts "Option 9: Exit\n"
end

def program(selection)
  case selection
  when "1" # user manually add data
    input_students
  when "2"  # prints all students
    show_students
  when "3" # saves student data to csv file
    save_students
  when "4" # loads student data from csv file
    load_students
  when "9" # exits program
    exit
  else # exception case
    puts "I don't know what you meant, try again"
  end
end

#FILE HANDLING

def save_students
  file = File.open("students.csv", "w")
  #  iterate over the students array and save to file
  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:age], student[:height], student[:gender]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
  puts "\n\nFile successfully saved to students.csv\n\n"
end

def get_filename
  puts "Do you want to load a different file then 'students.csv'? Type 'yes' or 'no'"
  choice = gets.chomp
  if choice.chr == "y"
    puts "Enter file you want to load, including file extension"
    filename = gets.chomp
  elsif choice.chr == "n"
    filename = "students.csv"
  else
    puts "I did not understand your choice.\n"
  end
  return filename
end

def load_students
  filename = get_filename
  puts filename
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort, age, height, gender = line.chomp.split(",")
    @students << {name: name.to_sym, cohort: cohort.to_sym, age: age, height: height, gender: gender.to_sym}
  end
  file.close
  puts "\nFile #{filename} successfully loaded\n"
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "loaded #{@students.count} from #{filename}"
  else #if it doesn't exist
    puts "sorry #{filename} doesn't exist"
    exit
  end
end

# PROGRAM EXECUTION

def interactive_menu
  load_students
  loop do
  print_menu
  program(STDIN.gets.chomp)
  end
end

try_load_students
interactive_menu
