class AddUserIdExpenseGroup < ActiveRecord::Migration[6.1]
  def change
    add_column :expense_groups, :user_id, :integer
  end
end
