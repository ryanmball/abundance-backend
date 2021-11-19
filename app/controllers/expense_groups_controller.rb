class ExpenseGroupsController < ApplicationController
  def index
    render json: ExpenseGroup.where(user_id: current_user.id).order(:start_date)
  end

  def create
    expense_group = ExpenseGroup.new(
      name: params[:name],
      start_date: params[:start_date],
      end_date: params[:end_date],
    )
    if expense_group.save
      render json: expense_group         #HAPPY PATH
    else
      render json: { errors: expense_group.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end

    def show
      render json: ExpenseGroup.find(params[:id])
    end

    def update
      expense_group = ExpenseGroup.find(params[:id])
      expense_group.name = params[:name] || expense_group.name
      expense_group.start_date = params[:start_date] || expense_group.start_date
      expense_group.end_date = params[:end_date] || expense_group.end_date
      if expense_group.save
        render json: expense_group         #HAPPY PATH
      else
        render json: { errors: expense_group.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
      end
    end

    def destroy
      expense_group = ExpenseGroup.find(params[:id])
      expense_group.destroy
      render json: { message: "Expense group successfully destroyed"}
    end
  end
end
