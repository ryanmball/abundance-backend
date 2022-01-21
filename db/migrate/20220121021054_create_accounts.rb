class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.string :account_identifier
      t.string :description
      t.string :type
      t.string :accounting_type
      t.integer :user_id
      t.timestamps
    end
  end
end
