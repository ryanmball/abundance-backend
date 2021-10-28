class CurrentBalance < ApplicationRecord
  belongs_to :user
  
  attribute :checking1, default: 0
  attribute :checking2, default: 0
  attribute :savings1, default: 0
  attribute :savings2, default: 0
  attribute :credit_card1, default: 0
  attribute :credit_card2, default: 0
  attribute :credit_card3, default: 0
  attribute :credit_card4, default: 0
end
