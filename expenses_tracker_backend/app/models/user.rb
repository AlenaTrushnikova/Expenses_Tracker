class User < ApplicationRecord
  has_many :expenses
  has_many :categories, through: :expenses

  def self.grouped_expenses(user_id)
    user = User.where(id: user_id)[0]
    user_expenses = user.expenses
    grouped_categories = []
    uniq_categories = user_expenses.map { |expense| expense[:category_id] }.uniq

    uniq_categories.each do |category|
      user_expenses.each do |expense|
        if expense[:category_id] == category
          found = false
          grouped_categories.each do |grouped_category|
            if grouped_category[:category_id] == category
              found = true
              grouped_category[:amount] += expense[:amount]
            end
          end
          if !found
            category_name = Category.find_by(id: category)[:name]
            grouped_categories.push({ category_id: category, amount: expense[:amount], categoryName: category_name})
          end
        end
      end
    end
    total_amount = grouped_categories.map{|category| category[:amount]}.sum.round(2)
    {categories: grouped_categories, totalAmount: total_amount}
  end

end

