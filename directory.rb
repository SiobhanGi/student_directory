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
    puts current_student
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



def specific_students
  puts "Enter the first letter of the names you want to print, or type 'ALL."
  specific_letter = gets.chomp.upcase
end

def sort_students(specific_letter, students)
  sorted_students = if specific_letter == "ALL"
    students
  else
    students.select {|n| n[:name][0] == specific_letter}
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(sorted_students)
  i = 0
  until i == sorted_students.size
    if sorted_students[i][:name].size <= 12
      puts ""
      puts ("#{(i+1)}. #{sorted_students[i][:name]}, (#{sorted_students[i][:cohort]} cohort)").center(40)
      puts ("D.O.B: #{sorted_students[i][:dob]}").center(40)
      puts ("height: #{sorted_students[i][:height]}").center(40)
      puts ("gender: #{sorted_students[i][:gender]}").center(40)
      i += 1
    end
  end
end

def print_footer(sorted_students)
    puts "\nOverall, we have #{sorted_students.count} great students."
end


students = input_students
specific_letter = specific_students
sorted_students = sort_students(specific_letter, students)

print_header

if students.size >= 1
  print(sorted_students)
end

print_footer(sorted_students)
