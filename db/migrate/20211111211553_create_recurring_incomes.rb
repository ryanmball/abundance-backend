class CreateRecurringIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :recurring_incomes do |t|
      t.string :category
      t.string :name
      t.string :description
      t.decimal :estimate, precision: 10, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
