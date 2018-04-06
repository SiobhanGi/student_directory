#name, cohort, hobbies, height input seperated into different methods
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
#def to populate dict with fields
def input_students
  students = []
  puts "Please enter the names of the student."
  name = gets.chomp
  #pushes to dict if the name passes the conditions, calls the other methods
  while !name.empty? do
    current_student = Hash.new("EMPTY")
    current_student = {name: name.capitalize.to_sym, cohort: cohort, dob: dob, height: height, gender: gender}.reject {|k,v| v == nil}
    current_student.each do |k, v|
      puts "#{k}: #{v}"
    end
    puts "\nAre these details correct?"
    user_input = gets.chomp.downcase
    if user_input == "yes"
      students << current_student
      if current_student.size <= 1
        puts "Now we have #{students.count} student."
      else
        puts "Now we have #{students.count} students."
      end
    end
    puts "Please enter the names of the student."
    name = gets.chomp
  end
  students
end

def specific_students(students)
  puts "Enter the first letter of the names you want to print"
  specific_letter = gets.chomp.upcase
  students = students.select {|n| n[:name][0] == specific_letter}
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  i = 0
  if students.size >= 1
    students.map {|dict| dict[:cohort]}.uniq.each do |cohort|
      puts ""
      puts "#{cohort}".center(40)
      students.each do |student|
        if student[:cohort] == cohort
            puts ""
            puts ("#{(i+1)}. #{students[i][:name]}").center(40)
            puts ("D.O.B: #{students[i][:dob]}").center(40)
            puts ("height: #{students[i][:height]}").center(40)
            puts ("gender: #{students[i][:gender]}").center(40)
            i+=1
        end
      end
    end
  end
end

def print_footer(students)
    puts "\nOverall, we have #{students.count} great students."
end

def interactive_menu
  students = []
  loop do
  #   1. Print the menu and ask what to do.
  puts "Which option would you like to do?\n\n"
  puts "Option 1: Input the students"
  puts "Option 2: Show the students"
  puts "Option 9: Exit\n"
  #   2. Read the input and save it to a variable
  selection = gets.chomp
  #   3. Do what the user has asked
    case selection
    when "1"
      # user adds students
      students = input_students
    when "2"
      # prints all students
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again"
    end
  #   4.Repeat from step 1
  end
end

interactive_menu
