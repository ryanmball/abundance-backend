class CreateIncomes < ActiveRecord::Migration[6.1]
  def change
    create_table :incomes do |t|
      t.date :date
      t.decimal :amount, precision: 10, scale: 2
      t.string :category
      t.string :description
      t.integer :user_id

      t.timestamps
    end
  end
end
