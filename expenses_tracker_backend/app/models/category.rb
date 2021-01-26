class Category < ApplicationRecord
  has_many :expenses
  has_many :categories, through: :expenses
  byebug
end
