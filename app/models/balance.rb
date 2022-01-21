class Balance < ApplicationRecord
  validates :month, presence: true
  validates :year, presence: true
  validates :date, presence: true
  validates :account_name, presence: true
  validates :balance, presence: true
  validates :type, presence: true
  validates :accounting_type, presence: true
  validates :net_cash?, presence: true
  validates :monthly_balance?, presence: true
  
  belongs_to :user
end
