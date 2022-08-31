# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "sadest seeder ever started"

User.create!(email: "employee@test.com", first_name: "Employee", last_name: "Last name", rank: "Emp", admin: nil, password: "123456")

User.create!(email: "manager@test.com", first_name: "Manager", last_name: "Last name manager", rank: "Man", admin: true, password: "123456")

Task.create!(name: "First task", description: "Testing my first task", )

test = EmployeeTask.new
test.task = Task.find(1)
test.user = User.find(1)
test.save

puts "sadest seeder ever ended"