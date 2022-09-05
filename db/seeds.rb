# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'
require 'open-uri'
require 'mechanize'
require 'nokogiri'

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

puts `clear`

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

puts "=============================="
puts "Inserted Task for testing with 4 Steps"
puts "#{task.name} | #{task.description}"
puts "=============================="
puts "#{step_one.instruction} | #{step_one.info}"
puts "#{step_two.instruction} | #{step_two.info}"
puts "#{step_three.instruction} | #{step_three.info}"
puts "#{step_four.instruction} | #{step_four.info}"
puts "=============================="

puts "Start inserting 20 random Employees with Tasks assigned..."
sleep(3)

agent = Mechanize.new
agent.get("https://www.linkedin.com/login/de?fromSignIn=true&trk=guest_homepage-basic_nav-header-signin") do |page|
  linkedin = page.form_with(action: '/checkpoint/lg/login-submit') do |form|
    form['user[session_key]'] = "mschuchowski@gmx.de",
    form['user[session_password]'] = "0111MiSchu1999"
  end.submit
end

diehl_defence = agent.get("https://www.linkedin.com/company/diehl-defence/people/")
doc = Nokogiri::HTML(diehl_defence.content.toutf8)
h1 = doc.xpath('h1').text
puts h1

# 5.times do
#   first_name = Faker::Name.first_name
#   last_name = Faker::Name.last_name
#   file = URI.open(Faker::LoremFlickr.image(size: "300x300", search_terms: ['profile'], match_all: true))

#   employee = User.create(
#     first_name: first_name,
#     last_name: last_name,
#     rank: Faker::Job.title, admin: false,
#     email: Faker::Internet.email(name: "#{first_name} #{last_name}", separators: ".", domain: "mail"),
#     password: "123456"
#   )

#   employee.photo.attach(io: file, filename: "#{employee.first_name}_#{employee.last_name}.png", content_type: "image/png")
#   employee.save

#   puts "Inserted Employee #{employee.email}"
# end
