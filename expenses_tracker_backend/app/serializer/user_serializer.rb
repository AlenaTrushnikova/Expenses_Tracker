class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :all_categories
  has_many :expenses
  has_many :categories
  # def expense_categories
  #   object.expenses.map{|exp| exp.category.name}
  # end

  def all_categories
    # categories = {}
    #  Category.all.each do |c|
    #    categories[c.id] = c.name
    #  end
    #  categories
    Category.all.map{|c| c.name}
  end
end