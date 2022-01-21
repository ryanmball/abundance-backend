class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true

  has_many :expenses
  has_many :incomes
  has_many :monthly_balances
  has_many :balances
  has_many :current_balances
  has_many :recurring_expenses
  has_many :recurring_incomes
end
