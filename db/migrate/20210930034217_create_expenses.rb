class CreateExpenses < ActiveRecord::Migration[6.1]
  def change
    create_table :expenses do |t|
      t.string :date
      t.decimal :amount, precision: 10, scale: 2
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
