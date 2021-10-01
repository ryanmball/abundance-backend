class IncomesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: Income.where(user_id: current_user.id).order(:date)
  end

  def create
    income = Income.new(
      date: params[:date],
      amount: params[:amount],
      category: params[:category],
      description: params[:description],
      user_id: current_user.id,
    )
    if income.save
      render json: income         #HAPPY PATH
    else
      render json: { errors: income.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: Income.find(params[:id])
  end

  def update
    income = Income.find(params[:id])
    income.date = params[:date] || income.date
    income.amount = params[:amount] || income.amount
    income.category = params[:category] || income.category
    income.description = params[:description] || income.description
    if income.save
      render json: income         #HAPPY PATH
    else
      render json: { errors: income.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    render json: { message: "Income successfully destroyed!"}
  end

end
