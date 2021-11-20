class ExpenseGroupSerializer < ActiveModel::Serializer
  attributes :id, :name, :start_date, :end_date, :total, :category_totals

  has_many :expenses

  def total
    object.expenses.sum { |expense| expense[:amount] }
  end

  def category_totals
    category_hash = Hash.new(0)
    object.expenses.each { |expense| category_hash[expense.category] += expense.amount }
    category_hash
  end
end
