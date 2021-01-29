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

u1 = User.create(name: "Alena", budget: 8000.00)
u2 = User.create(name: "Juan", budget: 10000.00)
u3 = User.create(name: "test", budget: 1000000.00)



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


e11 = Expense.create(amount: 7.65, date: "2021-01-02", description: "Coffee", category_id: c5.id, user_id: u1.id)
e12 = Expense.create(amount: 365.00, date: "2021-01-02", description: "Auto Insurance", category_id: c3.id, user_id: u1.id)
e13 = Expense.create(amount: 7.65, date: "2021-01-02", description: "Coffee", category_id: c5.id, user_id: u1.id)
e14 = Expense.create(amount: 7.65, date: "2021-01-03", description: "Coffee", category_id: c5.id, user_id: u1.id)
e15 = Expense.create(amount: 3.99, date: "2021-01-03", description: "Amazon Prime Video", category_id: c6.id, user_id: u1.id)
e16 = Expense.create(amount: 7.65, date: "2021-01-04", description: "Coffee", category_id: c5.id, user_id: u1.id)
e17 = Expense.create(amount: 7.65, date: "2021-01-05", description: "Coffee", category_id: c5.id, user_id: u1.id)
e18 = Expense.create(amount: 80.80, date: "2021-01-05", description: "Grocery", category_id: c4.id, user_id: u1.id)
e19 = Expense.create(amount: 7.65, date: "2021-01-06", description: "Coffee", category_id: c5.id, user_id: u1.id)
e110 = Expense.create(amount: 7.65, date: "2021-01-07", description: "Coffee", category_id: c5.id, user_id: u1.id)
e111 = Expense.create(amount: 18.00, date: "2021-01-12", description: "Lunch", category_id: c5.id, user_id: u1.id)
e112 = Expense.create(amount: 250.00, date: "2021-01-15", description: "Utilities", category_id: c2.id, user_id: u1.id)
e113 = Expense.create(amount: 7.65, date: "2021-01-16", description: "Coffee", category_id: c5.id, user_id: u1.id)
e114 = Expense.create(amount: 90.00, date: "2021-01-17", description: "Hair Cut", category_id: c7.id, user_id: u1.id)
e115 = Expense.create(amount: 7.65, date: "2021-01-18", description: "Coffee", category_id: c5.id, user_id: u1.id)
e116 = Expense.create(amount: 2530.00, date: "2021-01-22", description: "Primrose School", category_id: c9.id, user_id: u1.id)
e117 = Expense.create(amount: 200.00, date: "2021-01-23", description: "The Anti-Corruption Foundation Support", category_id: c13.id, user_id: u1.id)
e118 = Expense.create(amount: 7.65, date: "2021-01-24", description: "Coffee", category_id: c5.id, user_id: u1.id)
e119 = Expense.create(amount: 7.65, date: "2021-01-26", description: "Coffee", category_id: c5.id, user_id: u1.id)
e120 = Expense.create(amount: 1800.00, date: "2021-01-28", description: "Vacation", category_id: c11.id, user_id: u1.id)
e121 = Expense.create(amount: 7.65, date: "2021-01-28", description: "Coffee", category_id: c5.id, user_id: u1.id)
e122 = Expense.create(amount: 3500.80, date: "2021-01-31", description: "Rent", category_id: c1.id, user_id: u1.id)

e21 = Expense.create(amount: 2500.00, date: "2021-01-31", description: "Rent", category_id: c5.id, user_id: u2.id)
e22 = Expense.create(amount: 200.00, date: "2021-01-15", description: "Utilities", category_id: c3.id, user_id: u2.id)
e23 = Expense.create(amount: 135.00, date: "2021-01-01", description: "Flight to SEA", category_id: c1.id, user_id: u2.id)
e24 = Expense.create(amount: 2500.00, date: "2020-12-31", description: "Rent", category_id: c5.id, user_id: u2.id)
e25 = Expense.create(amount: 200.00, date: "2020-12-15", description: "Utilities", category_id: c3.id, user_id: u2.id)
e26 = Expense.create(amount: 150.00, date: "2021-01-01", description: "Costco", category_id: c2.id, user_id: u2.id)

e31 = Expense.create(amount: 11000.00, date: "2021-01-02", description: "Flatiron Course", category_id: c12.id, user_id: u3.id)
e32 = Expense.create(amount: 5999.99, date: "2021-01-10", description: "Family Vacation", category_id: c11.id, user_id: u3.id)
e33 = Expense.create(amount: 47190.00, date: "2021-01-20", description: "New Tesla", category_id: c3.id, user_id: u3.id)
e34 = Expense.create(amount: 3600.00, date: "2021-01-31", description: "Rent", category_id: c1.id, user_id: u3.id)

puts 'done'