class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget #:expense_categories
  has_many :expenses
  # has_many :categories
  def expense_categories
    object.expenses.map{|exp| exp.category.name}
  end
end