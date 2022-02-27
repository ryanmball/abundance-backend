class UpdateAccountsTable < ActiveRecord::Migration[6.1]
  def change
    rename_column :accounts, :account_identifier, :identifier
    rename_column :accounts, :account_type, :type
    remove_column :accounts, :accounting_type
  end
end
