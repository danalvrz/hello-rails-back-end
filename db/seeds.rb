# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Greeting.create(message: "Hola!")
g1 = Greeting.create(message: "Hallo!")
Greeting.create(message: "Hello!")
g2 = Greeting.create(message: "Hi!")
Greeting.create(message: "Moin!")
User.destroy_all
u1 = User.create(username: "Testo1", password: "12345")
u2 = User.create(username: "Testo2", password: "123456")
f1 = Favorite.create(user: u1, greeting: g1)
f2 = Favorite.create(user: u1, greeting: g2)
f3 = Favorite.create(user: u2, greeting: g1)
