class AddRecurring < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :recurring, :boolean, default: false
    add_column :incomes, :recurring, :boolean, default: false
  end
end
