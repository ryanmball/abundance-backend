class MonthlyBalance < ApplicationRecord
  validates :month, presence: true

  belongs_to :user
end
