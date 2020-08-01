require 'csv'
require 'pp'

class Student
	attr_accessor :id, :name, :last_name, :age

	def initialize(id, name, last_name, age)
		@id				 = id
		@name 		 = name.capitalize
		@last_name = last_name.capitalize
		@age       = age.to_i
	end

	def filename
		[id, name.downcase, last_name.downcase].join("-")
	end

	def save
		File.open("data/#{filename}.csv", "w") do |entry|
			entry.write(self.to_csv)
		end
	end

	def to_csv
		CSV.generate do |csv|
			csv << [id, name, last_name, age]
		end
	end
end

def validator(field_name, input)
  while input.length == 0 do
    print "#{field_name} can't be blank.\nPlease repeat student #{field_name.downcase}: "
    input = gets.chomp
  end
  return input
end

def age_valid(field_name, input)
	while input.length == 0 && input.to_i < 15 do
		print "#{field_name} cant be blank and should be greater than 15.\nPlease repeat student #{field_name.downcase}: "
		input = gets.chomp
	end
	return input
end

proceed = true
while proceed do

	puts "Welcome to the student list app."
	puts "Available actions listed below:"
	puts '--------------------'
	puts "'new' to create record for the student"
	puts "'edit' to change the existing record"
	puts "'show' to show the student record"
	puts "'delete' to delete the student record"
	puts "'list' to list all students"
	puts "'exit' to exit the program"
	puts '--------------------'
	print "Enter your choice: "
	input_choice = gets.chomp.downcase

	if input_choice == 'exit'
		puts '--------------------'
		puts "Bye!"
		proceed = false

	elsif input_choice == 'new'
		print "Enter student name: "
		get_name = gets.chomp
		input_name = validator('Student name', get_name)
		print "Enter student last name: "
		get_last = gets.chomp
		input_last_name = validator('Last name', get_last)
		print "Enter student age: "
		get_age = gets.chomp
		input_age = age_valid('Student age', get_age)
		input_id = rand (1000..9999)
		entry = Student.new(input_id, input_name, input_last_name, input_age)
		entry.save
		puts '--------------------'
		puts "Student #{input_name.capitalize} #{input_last_name.capitalize} record with ID #{input_id} created."
		puts '--------------------'

	elsif input_choice == 'list'
		puts '--------------------'
		Dir['data/*'].each do |file_name|
  		if !File.directory? file_name[0]
  			puts file_name
  		end
		end
		puts '--------------------'

	elsif input_choice == 'show'
		print "Enter the student ID you would like to see: "
		input_id = gets.chomp
		file = Dir["data/#{input_id}*.csv"][0]
		if file != nil
			puts "Student information:"
			puts '--------------------'
			File.open(file, 'r') do |f|
				pp f.readline
			end
			puts '--------------------'
		else
			puts "There is no student with ID #{input_id}."
		end


	elsif input_choice == 'edit'
		print "Enter the student ID you would like to edit: "
		input_id = gets.chomp.to_i
		puts "Current student information:"
		file = Dir["data/#{input_id}*.csv"][0]
		File.open(file, 'r') do |f|
			pp f.readline
		end
		File.delete(file)
		print "Update student name: "
		get_name = gets.chomp
		input_name = validator('Student name', get_name)
		print "Update student last name: "
		get_last = gets.chomp
		input_last_name = validator('Last name', get_last)
		print "Update student age: "
		get_age = gets.chomp
		input_age = age_valid('Student age', get_age)
		entry = Student.new(input_id, input_name, input_last_name, input_age)
		entry.save
		puts '--------------------'
		puts "Student #{input_name.capitalize} #{input_last_name.capitalize} information updated."
		puts '--------------------'

	elsif input_choice == 'delete'
		print "Enter the student ID you would like to delete: "
		input_id = gets.chomp.to_i
		file = Dir["data/#{input_id}*.csv"][0]
		if file != nil
			File.open(file, 'r') do |f|
				pp f.readline
			end
			print "Enter 'y' if you if you realy want to delete the record\nor press any button: "
			input_delete = gets.chomp.downcase
			if input_delete == 'y'
				File.delete(file)
				puts '--------------------'
				puts "Student record with ID #{input_id} deleted."
				puts '--------------------'
			else
				nil
			end
		else
			puts "No student with ID #{input_id} found."
		end

	else
		puts "Please enter a valid option: "
	end

end
