class CreateMonthlyBalances < ActiveRecord::Migration[6.1]
  def change
    create_table :monthly_balances do |t|
      t.integer :month
      t.decimal :checking1, precision: 10, scale: 2
      t.decimal :checking2, precision: 10, scale: 2
      t.decimal :savings1, precision: 10, scale: 2
      t.decimal :savings2, precision: 10, scale: 2
      t.decimal :credit_card1, precision: 10, scale: 2
      t.decimal :credit_card2, precision: 10, scale: 2
      t.decimal :credit_card3, precision: 10, scale: 2
      t.decimal :credit_card4, precision: 10, scale: 2
      t.decimal :loan1, precision: 10, scale: 2
      t.decimal :loan2, precision: 10, scale: 2
      t.integer :user_id

      t.timestamps
    end
  end
end
