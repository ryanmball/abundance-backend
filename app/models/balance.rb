class Balance < ApplicationRecord
  validates :month, presence: true
  validates :year, presence: true
  validates :amount, presence: true

  belongs_to :account
end
