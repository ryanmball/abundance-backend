class Account < ApplicationRecord
  validates :name, presence: true
  validates :account_identifier, presence: true
  validates :account_type, presence: true
  validates :accounting_type, presence: true

  belongs_to :user
  has_many :balances
  has_many :expenses
end
