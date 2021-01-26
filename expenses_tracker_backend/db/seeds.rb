# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Expense.destroy_all
User.destroy_all
Category.destroy_all

u1 = User.create(name: "Alena", budget: 1000.00)
u2 = User.create(name: "Juan", budget: 10000.00)


c1 = Category.create(name: "Travel")
c2 = Category.create(name: "Grocery")
c3 = Category.create(name: "Bills and Utilities")
c4 = Category.create(name: "Restaurants and Cafes")
c5 = Category.create(name: "Housing")

e11 = Expense.create(amount: 7.65, date: "01/25/2021", description: "Coffee", category_id: c4.id, user_id: u1.id)
e12 = Expense.create(amount: 80.80, date: "01/01/2021", description: "Food", category_id: c2.id, user_id: u1.id)
e13 = Expense.create(amount: 18.00, date: "01/20/2021", description: "Lunch", category_id: c4.id, user_id: u1.id)
e21 = Expense.create(amount: 2500.00, date: "01/30/2021", description: "Rent", category_id: c5.id, user_id: u2.id)
e22 = Expense.create(amount: 200.00, date: "01/15/2021", description: "Utilities", category_id: c3.id, user_id: u2.id)
e23 = Expense.create(amount: 135.00, date: "02/15/2021", description: "Flight to SEA", category_id: c1.id, user_id: u2.id)

puts 'done'