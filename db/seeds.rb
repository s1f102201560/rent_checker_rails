# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users_lst = []

10.times do |i|
  name = "user#{i+1}"
  email = "#{name}@example.com"
  users_lst << { name: name, email: email }
end

User.create!(users_lst)

