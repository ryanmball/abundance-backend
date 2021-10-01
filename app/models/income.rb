class Income < ApplicationRecord
  validates :date, presence: true
  validates :amount, presence: true
  validates :category, presence: true
  
  belongs_to :user
end
