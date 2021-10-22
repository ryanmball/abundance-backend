class AddIraToMonthlyBalances < ActiveRecord::Migration[6.1]
  def change
    add_column :monthly_balances, :personal_IRA, :decimal, precision: 10, scale: 2
  end
end
