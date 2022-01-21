class Expense < ApplicationRecord
  validates :date, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  
  belongs_to :user
  belongs_to :expense_group, optional: true
  belongs_to :account
end
