class DropRecurring < ActiveRecord::Migration[6.1]
  def change
    drop_table :recurring_expenses
    drop_table :recurring_incomes
  end
end
