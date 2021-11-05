class AddMonthYear < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :month, :integer
    add_column :expenses, :year, :integer
    add_column :incomes, :month, :integer
    add_column :incomes, :year, :integer
  end
end
