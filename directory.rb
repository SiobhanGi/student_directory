  # puts all students into an array
students = [
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"]

#  print out all the students
puts "The students of Villains Academy"
puts "-------------"

students.each do |student|
  puts student
end

#  print final number of students
puts "\nOverall, we have #{students.count} great students."
