class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.integer :month
      t.integer :year
      t.date :date
      t.string :account_name
      t.decimal :balance, precision: 10, scale: 2
      t.string :type
      t.string :accounting_type
      t.boolean :net_cash?
      t.string :date_identifier
      t.boolean :monthly_balance?
      t.integer :user_id
      t.timestamps
    end
  end
end
