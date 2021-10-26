class AddYearToMonthlyBalances < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_balances, :year, :integer
  end
end
