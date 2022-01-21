class ChangeBalanceNameToAmount < ActiveRecord::Migration[6.1]
  def change
    rename_column :balances, :balance, :amount
  end
end
