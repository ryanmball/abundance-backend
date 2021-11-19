class CreateExpenseGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :expense_groups do |t|
      t.string :name
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
