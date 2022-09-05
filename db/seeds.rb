# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts `clear`
puts "Cleaning database..."
User.destroy_all
Task.destroy_all

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

puts `clear`

puts "Start creating 3 testing tasks..."
sleep(1)

task = Task.create(
  name: "Drain the water from the pretreatment tubs",
  description: "Every week the tubs needs to be refreshed. You will need to use the pump for that."
)
Step.create(
  instruction: "Open water taps",
  info: "Each tub have 2 taps",
  task_id: task.id,
  order: 1
)
Step.create(
  instruction: "Open the waste water tap",
  info: "There is only one waster water tap for all tubs",
  task_id: task.id,
  order: 2
)
Step.create(
  instruction: "Start the pump",
  info: "Open the compressed air ventil to start the pump",
  task_id: task.id,
  order: 3
)
Step.create(
  instruction: "After the tubs are empty, close the taps again",
  info: "Make sure you close all taps proably, before filling the tubs with water",
  task_id: task.id,
  order: 4
)

task2 = Task.create(
  name: "Collect all the metal waste and sort it by material",
  description: "Every day the metal waste should get collected and sorted by material."
)
Step.create(
  instruction: "Collect all buckets with metal waste",
  info: "Use the pallet truck for transportation!",
  task_id: task2.id,
  order: 1
)
Step.create(
  instruction: "Sort them by material and put in your transport wagon",
  info: "Careful! Use cut-resistant gloves.",
  task_id: task2.id,
  order: 2
)
Step.create(
  instruction: "Bring back the buckets to their station",
  info: "Use the pallet truck for transportation!",
  task_id: task2.id,
  order: 3
)
Step.create(
  instruction: "Throw them sortet in the big containers outside",
  info: "Use the provided lifter for the containers!",
  task_id: task2.id,
  order: 4
)

task3 = Task.create(
  name: "Cleaning the electric polishing tub",
  description: "Be very careful. Thats 98.5% phosphor asid!"
)
Step.create(
  instruction: "Make sure the pumps are stopped and wait until the asid appears",
  info: "While your working at the acid tub its mandatory to wear protection glasses!",
  task_id: task3.id,
  order: 1
)
Step.create(
  instruction: "Now remove all the copper mud with the provided shovel",
  info: "Remember to also wear chemical gloves and arm protectors!",
  task_id: task3.id,
  order: 2
)
Step.create(
  instruction: "Rinse off the leftover and make sure no cobber is left in the container",
  info: "Careful not too much water! Water on acid reacts to become very hot!",
  task_id: task3.id,
  order: 3
)
Step.create(
  instruction: "Make sure you put the valves on it and wash your equipment after",
  info: "While rinsing off your equipment, you still need to wear your gloves.",
  task_id: task3.id,
  order: 4
)

puts `clear`

puts "One Manager account has been generated!"
puts "=============================="
puts admin.email
puts admin.password

puts "One Employee account has been generated!"
puts "=============================="
puts employee.email
puts employee.password
puts "Inserted 3 testing tasks successfully."
puts "Start inserting 20 random Employees with Tasks assigned..."
sleep(1)

counter = 0

20.times do
  first_name = ""
  last_name = ""
  counter += 1
  case counter
  when 1
    first_name = "Tuyet"
    last_name = "Zieme"
  when 2
    first_name = "Versie"
    last_name = "Lesch"
  when 3
    first_name = "Renaldo"
    last_name = "Baumbach"
  when 4
    first_name = "Tory"
    last_name = "Bechtelar"
  when 5
    first_name = "Lilia"
    last_name = "Block"
  when 6
    first_name = "Danial"
    last_name = "Harris"
  when 7
    first_name = "Emogene"
    last_name = "Cartwright"
  when 8
    first_name = "Carmelia"
    last_name = "Lehner"
  when 9
    first_name = "Thomasena"
    last_name = "Bogan"
  when 10
    first_name = "Leena"
    last_name = "Predovic"
  when 11
    first_name = "Ahmed"
    last_name = "Pagac"
  when 12
    first_name = "Hector"
    last_name = "Mitchell"
  when 13
    first_name = "Tom"
    last_name = "Smith"
  when 14
    first_name = "Antonis"
    last_name = "Haris"
  when 15
    first_name = "Boris"
    last_name = "Jackson"
  when 16
    first_name = "Phil"
    last_name = "Summer"
  when 17
    first_name = "Erik"
    last_name = "Winter"
  when 18
    first_name = "Angelic "
    last_name = "Feeney"
  when 19
    first_name = "Claris"
    last_name = "Schneider"
  when 20
    first_name = "Peter"
    last_name = "Hampton"
  end

  employee = User.new(first_name:,
                      last_name:,
                      rank: Faker::Job.title,
                      admin: false,
                      email: Faker::Internet.email(name: "#{first_name} #{last_name}", separators: ".", domain: "mail"),
                      password: "123456")
  employee.save
  employee.photo.attach(io: File.open(File.join(Rails.root, "/app/assets/images/seeding/avatar-#{counter}.jpg")), filename: "avatar-#{counter}.jpg", content_type: "image/jpg")
  employee.save

  puts "Inserted Employee #{employee.email}"

  employee_task = EmployeeTask.create
  employee_task.user = employee
  employee_task.task = Task.find(rand(1..Task.count))
  employee_task.save

  puts "Created EmployeeTask for #{employee.email}"
end
