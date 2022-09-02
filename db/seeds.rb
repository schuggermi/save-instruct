# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

admin = User.create(
  first_name: "Max",
  last_name: "Mustermann",
  rank: "Admin", admin: true,
  email: "max.mustermann@mail.com",
  password: "123456"
)

employee = User.create(
  first_name: "Max",
  last_name: "Mustermann",
  rank: "Employee", admin: false,
  email: "employee.max.mustermann@mail.com",
  password: "123456"
)

puts "=============================="
puts "One Manager account has been generated!"
puts admin.email
puts admin.password
puts "=============================="

puts "=============================="
puts "One Employee account has been generated!"
puts employee.email
puts employee.password
puts "=============================="

task = Task.create(
  name: "Drain the water from the pretreatment tubs",
  description: "Every week the tubs needs to be refreshed. You will need to use the pump for that."
)

step_one = Step.create(
  instruction: "Open water taps",
  info: "Each tub have 2 taps",
  task_id: task.id,
  order: 1
)

step_two = Step.create(
  instruction: "Open the waste water tap",
  info: "There is only one waster water tap for all tubs",
  task_id: task.id,
  order: 2
)

step_three = Step.create(
  instruction: "Start the pump",
  info: "Open the compressed air ventil to start the pump",
  task_id: task.id,
  order: 3
)

step_four = Step.create(
  instruction: "After the tubs are empty, close the taps again",
  info: "Make sure you close all taps proably, before filling the tubs with water",
  task_id: task.id,
  order: 4
)

puts "=============================="
puts "Inserted Task for testing with 4 Steps"
puts "#{task.name} | #{task.description}"
puts "=============================="
puts "#{step_one.instruction} | #{step_one.info}"
puts "#{step_two.instruction} | #{step_two.info}"
puts "#{step_three.instruction} | #{step_three.info}"
puts "#{step_four.instruction} | #{step_four.info}"
puts "=============================="
