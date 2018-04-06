#name, cohort, hobbies, height input seperated into different methods
@students = []

def cohort
  puts "Enter the students cohort."
  cohort = gets.chop.to_sym.capitalize
end

def dob
puts "Please enter a students D.O.B."
dob = gets.chop.to_sym.capitalize
end

def height
  puts "Enter the students height."
  height = gets.chomp.to_sym.capitalize
end

def gender
  puts "Enter the students gender."
  gender = gets.chomp.to_sym.capitalize
end

def input_students
  puts "Please enter the names of the student."
  name = gets.chomp
  while !name.empty? do
  current_student = {name: name.capitalize.to_sym, cohort: cohort, dob: dob, height: height, gender: gender}.reject {|k,v| v == nil}
  current_student.each do |k, v|
    puts "#{k}: #{v}"
  end
  puts "\nAre these details correct? type 'yes' or 'no'"
  @students << current_student if gets.chomp.downcase.chr == "y"
  puts @students.size <= 1 ? "Now we have #{@students.count} student." : "Now we have #{@students.count} students."
  puts "Please enter the names of the student."
  name = gets.chomp
  end
end

def specific_students
  puts "Enter the first letter of the names you want to print"
  specific_letter = gets.chomp.upcase
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students_list
  i = 0
  if @students.size >= 1
    @students.map {|dict| dict[:cohort]}.uniq.each do |cohort|
      puts ""
      puts "#{cohort}".center(40)
      @students.each do |student|
        if student[:cohort] == cohort
            puts ""
            puts ("#{(i+1)}. #{@students[i][:name]}").center(40)
            puts ("D.O.B: #{@students[i][:dob]}").center(40)
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

def print_menu
  puts "Which option would you like to do?\n\n"
  puts "Option 1: Input the students"
  puts "Option 2: Show the students"
  puts "Option 9: Exit\n"
end

def show_students
  print_header
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    # user adds students
    input_students
  when "2"
    # prints all students
    show_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again"
  end
end

def interactive_menu
  loop do
  print_menu
  process(gets.chomp)
  end
end

interactive_menu
