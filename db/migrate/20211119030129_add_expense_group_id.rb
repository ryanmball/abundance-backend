class AddExpenseGroupId < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :expense_group_id, :integer
  end
end
