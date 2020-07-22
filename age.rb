# Programm ask to enter user name, birth year, month and day
# Then programm greets the user and calculates age in days, hours, minutes and years.
require 'date'
puts "Enter your name: "
name = gets.chomp
puts "Enter your birth year: "
year = gets.chomp.to_i
puts "Enter your birth month: "
month = gets.chomp.to_i
puts "Enter your birth day: "
day = gets.chomp.to_i
birthday = Date.new(year, month, day)
today = Date.today
age = (today - birthday).to_i
puts "Hello " + name
puts "You are " + age.to_s + " days old."
puts "Also you are " + (age*24).to_s + " hours old."
puts "Additionally you are " + (age*24*60).to_s + " minutes old."
puts "And finally you are " + (age.to_f / 365).to_s + " years old."
