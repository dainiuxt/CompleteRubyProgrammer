# Liko validacija; 'list' komandai rodyti failo turinį, o ne kelią
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

	def editfile
		Dir["data/#{input_id}*.csv"]
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
		puts "Program exited."
		proceed = false

	elsif input_choice == 'new'
		print "Enter student name: "
		input_name = gets.chomp
		print "Enter student last name: "
		input_last_name = gets.chomp
		print "Enter student age: "
		input_age = gets.chomp
		input_id = rand (1..1000)
		entry = Student.new(input_id, input_name, input_last_name, input_age)
		entry.save
		puts '--------------------'
		puts "Student #{input_name.capitalize} #{input_last_name.capitalize} record created."
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
		input_id = gets.chomp.to_i
		puts "Student information:"
		file = Dir["data/#{input_id}*.csv"][0]
		puts '--------------------'
		File.open(file, 'r') do |f|
			pp f.readline
		end
		puts '--------------------'

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
		input_name = gets.chomp
		print "Update student last name: "
		input_last_name = gets.chomp
		print "Update student age: "
		input_age = gets.chomp
		entry = Student.new(input_id, input_name, input_last_name, input_age)
		entry.save
		puts '--------------------'
		puts "Student #{input_name.capitalize} #{input_last_name.capitalize} information updated."
		puts '--------------------'

	elsif input_choice == 'delete'
		print "Enter the student ID you would like to delete: "
		input_id = gets.chomp.to_i
		file = Dir["data/#{input_id}*.csv"][0]
		File.open(file, 'r') do |f|
			pp f.readline
		end
		puts "Are you sure you want to delete this record? (y/n)"
		input_delete = gets.chomp.downcase
		if input_delete == 'y'
			File.delete(file)
			puts '--------------------'
			puts "Student record with ID #{input_id} deleted."
			puts '--------------------'
		else
			nil
		end
	end
end
