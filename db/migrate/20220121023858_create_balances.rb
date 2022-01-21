class CreateBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :balances do |t|
      t.integer :month
      t.integer :year
      t.decimal :balance, precision: 10, scale: 2
      t.string :date_identifier
      t.integer :account_id
      t.timestamps
    end
  end
end
