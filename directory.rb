#name, cohort, hobbies, height input seperated into different methods
require "csv"

@students = []

# INPUT METHODS

def message(field)
  puts "Enter the students #{field}"
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
  i = 0
  @students.each do |student|
    if student[:name][0] == specific_letter
      puts ("#{(i+1)}. #{student[:name]}").center(40)
      puts ("cohort: #{student[:name]}").center(40)
      puts ("age: #{student[:age]}").center(40)
      puts ("height: #{student[:height]}").center(40)
      puts ("gender: #{student[:gender]}").center(40)
      i+=1
    end
  end
end

# PRINT METHODS
def arr_sort
end

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
            puts ("#{(i+1)}. #{student[:name]}").center(40)
            puts ("age: #{student[:age]}").center(40)
            puts ("height: #{student[:height]}").center(40)
            puts ("gender: #{students[:gender]}").center(40)
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
  puts "Option 2: Show all students."
  puts "Option 3: Show specific students"
  puts "Option 4: Save students to csv file."
  puts "Option 5: Load students from csv file."
  puts "Option 9: Exit\n"
end

def program(selection)
  case selection
  when "1" # user manually add data
    input_students
  when "2"  # prints all students
    show_students
  when "3" #show specific students
    specific_students
  when "4" # saves student data to csv file
    save_students(filename("Save to"))
  when "5"# loads student data from csv file
    load_students(filename("Load"))
  when "9" # exits program
    exit
  else # exception case
    puts "I don't know what you meant, try again"
  end
end

#FILE HANDLING
def filename(save_or_load)
  puts "#{save_or_load} default file 'students.csv'? Type 'yes' or 'no'"
  user_choice = STDIN.gets.chomp
    if user_choice.chr == "y"
      filename = "students.csv"
    elsif user_choice.chr == "n"
      puts "Enter file name you want to " + save_or_load.downcase + ". Include file extenstion."
      filename = STDIN.gets.chomp.downcase
    else
      puts "Sorry invalid filename"
      exit
    end
  return filename
end

def save_students(filename="student.csv")
  CSV.open("./#{filename}", mode = "wb") do |csv|
    @students.each do |student|
      csv << [student[:name], student[:cohort], student[:age], student[:height], student[:gender]]
    end
  end
  puts "\n\nFile successfully saved to #{filename}\n\n"
end

def load_students(filename="students.csv")
  CSV.foreach("./#{filename}") do |row|
    name, cohort, age, height, gender = row
    @students << {name: name.to_sym, cohort: cohort.to_sym, age: age, height: height, gender: gender.to_sym}
  end
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
