class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.float :amount
      t.string :date
      t.string :description
      t.belongs_to :user
      t.belongs_to :category

      t.timestamps
    end
  end
end
