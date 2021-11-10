class AddDateIdentifier < ActiveRecord::Migration[6.1]
  def change
    add_column :expenses, :date_identifier, :string
    add_column :incomes, :date_identifier, :string
    add_column :monthly_balances, :date_identifier, :string
  end
end
