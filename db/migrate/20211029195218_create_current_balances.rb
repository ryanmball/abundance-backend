class CreateCurrentBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :current_balances do |t|
      t.decimal :checking1, precision: 10, scale: 2, default: 0.00
      t.decimal :checking2, precision: 10, scale: 2, default: 0.00
      t.decimal :savings1, precision: 10, scale: 2, default: 0.00
      t.decimal :savings2, precision: 10, scale: 2, default: 0.00
      t.decimal :credit_card1, precision: 10, scale: 2, default: 0.00
      t.decimal :credit_card2, precision: 10, scale: 2, default: 0.00
      t.decimal :credit_card3, precision: 10, scale: 2, default: 0.00
      t.decimal :credit_card4, precision: 10, scale: 2, default: 0.00
      t.decimal :net_cash, precision: 10, scale: 2

      
      t.integer :user_id

      t.timestamps
    end
  end
end
