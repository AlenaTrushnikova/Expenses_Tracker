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
u2 = User.create(name: "Juan", budget: 1900.00)


c1 = Category.create(name: "Housing")
c2 = Category.create(name: "Bills & Utilities")
c3 = Category.create(name: "Auto & Transport")
c4 = Category.create(name: "Shopping")
c5 = Category.create(name: "Food & Dining")
c6 = Category.create(name: "Entertainment")
c7 = Category.create(name: "Personal Care")
c8 = Category.create(name: "Health & Fitness")
c9 = Category.create(name: "Kids")
c10 = Category.create(name: "Investments")
c11 = Category.create(name: "Travel")
c12 = Category.create(name: "Education")
c13 = Category.create(name: "Gifts & Donations")
c14 = Category.create(name: "Fees & Charges")
c15 = Category.create(name: "Business Services")
c16 = Category.create(name: "Taxes")
c17 = Category.create(name: "Other")


e11 = Expense.create(amount: 7.65, date: "2021-01-01", description: "Coffee", category_id: c4.id, user_id: u1.id)
e12 = Expense.create(amount: 80.80, date: "2021-01-10", description: "Food", category_id: c2.id, user_id: u1.id)
e13 = Expense.create(amount: 18.00, date: "2021-01-12", description: "Lunch", category_id: c4.id, user_id: u1.id)
e14 = Expense.create(amount: 1000.00, date: "2021-01-01", description: "Vacation", category_id: c1.id, user_id: u1.id)
e15 = Expense.create(amount: 3000.80, date: "2021-01-31", description: "Rent", category_id: c5.id, user_id: u1.id)
e16 = Expense.create(amount: 250.00, date: "2021-01-15", description: "Utilities", category_id: c3.id, user_id: u1.id)
e17 = Expense.create(amount: 7.65, date: "2021-01-02", description: "Coffee", category_id: c4.id, user_id: u1.id)
e18 = Expense.create(amount: 7.65, date: "2021-01-03", description: "Coffee", category_id: c4.id, user_id: u1.id)
e19 = Expense.create(amount: 7.65, date: "2021-01-04", description: "Coffee", category_id: c4.id, user_id: u1.id)
e110 = Expense.create(amount: 7.65, date: "2021-01-05", description: "Coffee", category_id: c4.id, user_id: u1.id)
e111 = Expense.create(amount: 7.65, date: "2021-01-06", description: "Coffee", category_id: c4.id, user_id: u1.id)
e112 = Expense.create(amount: 7.65, date: "2021-01-07", description: "Coffee", category_id: c4.id, user_id: u1.id)


e21 = Expense.create(amount: 800.00, date: "2021-01-02", description: "Rent", category_id: c1.id, user_id: u2.id)
e22 = Expense.create(amount: 40.00, date: "2021-01-02", description: "Utilities", category_id: c2.id, user_id: u2.id)
e23 = Expense.create(amount: 60.00, date: "2021-01-02", description: "Internet", category_id: c2.id, user_id: u2.id)
e24 = Expense.create(amount: 140.00, date: "2021-01-02", description: "Costco", category_id: c5.id, user_id: u2.id)
e25 = Expense.create(amount: 10.00, date: "2021-01-02", description: "Spotify", category_id: c6.id, user_id: u2.id)
e26 = Expense.create(amount: 135.00, date: "2021-01-03", description: "Flight from SD", category_id: c11.id, user_id: u2.id)
e27 = Expense.create(amount: 49.00, date: "2021-01-03", description: "Parking Ticket", category_id: c5.id, user_id: u2.id)
e28 = Expense.create(amount: 210.00, date: "2021-01-10", description: "Costco", category_id: c5.id, user_id: u2.id)
e29 = Expense.create(amount: 120.00, date: "2021-01-15", description: "Phone plan", category_id: c2.id, user_id: u2.id)
e210 = Expense.create(amount: 60.00, date: "2020-12-15", description: "Oil Change", category_id: c3.id, user_id: u2.id)
e211 = Expense.create(amount: 40.00, date: "2021-01-15", description: "Chiropractor", category_id: c7.id, user_id: u2.id)
e212 = Expense.create(amount: 180.00, date: "2021-01-19", description: "Costco", category_id: c5.id, user_id: u2.id)
e213 = Expense.create(amount: 5.00, date: "2021-20-31", description: "Coffee", category_id: c5.id, user_id: u2.id)
e214 = Expense.create(amount: 49.00, date: "2021-01-21", description: "Parking Ticket", category_id: c5.id, user_id: u2.id)
e215 = Expense.create(amount: 10.00, date: "2021-01-22", description: "Lightroom", category_id: c15.id, user_id: u2.id)
e216 = Expense.create(amount: 40.00, date: "2021-01-25", description: "Nature Conservancy", category_id: c13.id, user_id: u2.id)
e217 = Expense.create(amount: 170.00, date: "2021-01-26", description: "Costco", category_id: c5.id, user_id: u2.id)
e218 = Expense.create(amount: 80.00, date: "2021-01-27", description: "Car Insurance", category_id: c3.id, user_id: u2.id)
e219 = Expense.create(amount: 50.00, date: "2021-01-27", description: "Gas", category_id: c3.id, user_id: u2.id)
e220 = Expense.create(amount: 30.00, date: "2021-01-28", description: "Bridge Tolls", category_id: c3.id, user_id: u2.id)



puts 'done'