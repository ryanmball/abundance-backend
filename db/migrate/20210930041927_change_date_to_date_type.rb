class ChangeDateToDateType < ActiveRecord::Migration[6.1]
  def change
    change_column :expenses, :date, "date USING CAST(date AS date)"
  end
end
