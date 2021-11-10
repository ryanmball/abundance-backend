class RecurringExpenseSerializer < ActiveModel::Serializer
  attributes :id, :category, :description, :estimate
end
