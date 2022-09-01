# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user = User.create(
  first_name: "Max",
  last_name: "Mustermann",
  rank: "Admin", admin: true,
  email: "max.mustermann@mail.com",
  password: "123456"
)

puts "One Manager account has been generated!"
puts user
