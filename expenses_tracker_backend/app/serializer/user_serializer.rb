class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget
  has_many :expenses
end