class RecurringIncomesController < ApplicationController
  def index
    render json: RecurringIncome.where(user_id: current_user.id).order(:category)
  end
end
