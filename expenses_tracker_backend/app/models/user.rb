class User < ApplicationRecord
  has_many :expenses
  has_many :categories, through: :expenses

  def getCategoryName(id)
    self.categories.find(id).name
  end
end
