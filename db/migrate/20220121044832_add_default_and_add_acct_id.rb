class AddDefaultAndAddAcctId < ActiveRecord::Migration[6.1]
  def change
    change_column :accounts, :net_cash_calc, :boolean, default: false
    add_column :expenses, :account_id, :integer
    add_column :incomes, :account_id, :integer
  end
end
