class RecurringIncomesController < ApplicationController
  def index
    recurring_incomes = RecurringIncome.where(user_id: current_user.id).order(:category)
    recurring_categories = RecurringIncome.where(user_id: current_user.id).pluck(:category).uniq
    render json: { incomes: recurring_expenses, categories: recurring_categories }
  end
end
