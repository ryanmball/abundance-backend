class ChangeBalanceColumnNames < ActiveRecord::Migration[6.1]
  def change
    rename_column :balances, :net_cash?, :net_cash_calc
    rename_column :balances, :monthly_balance?, :monthly_balance
  end
end
