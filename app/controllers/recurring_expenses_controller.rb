class RecurringExpensesController < ApplicationController
  def index
    render json: RecurringExpense.where(user_id: current_user.id).order(:category)
  end
end
