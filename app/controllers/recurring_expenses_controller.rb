class RecurringExpensesController < ApplicationController
  def index
    recurring_expenses = RecurringExpense.where(user_id: current_user.id).order(:category)
    recurring_categories = RecurringExpense.where(user_id: current_user.id).pluck(:category).uniq
    render json: { expenses: recurring_expenses, categories: recurring_categories }
  end
end
