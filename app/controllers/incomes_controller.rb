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
      recurring: params[:recurring],
      user_id: current_user.id,
    )
    income.year = income.date.year
    income.month = income.date.month
    income.date_identifier = "#{Date.new(income.date.year, income.date.month, 1).strftime("%^b")}.#{income.date.year}"
    if income.save
      render json: income         #HAPPY PATH
    else
      render json: { errors: income.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: Income.find(params[:id])
  end

  def destroy
    income = Income.find(params[:id])
    income.destroy
    render json: { message: "Income successfully destroyed!"}
  end

  def recurring
    render json: Income.where(user_id: current_user.id, recurring: true).pluck(:category, :description).uniq
  end

  def category_incomes
    all_incomes = Income.where(user_id: current_user.id)
    category_hash = Hash.new(0)
    all_incomes.each { |income| category_hash[income.category] += income.amount }
    total = 0
    category_hash.each { |k, v| total += v }
    render json: { category_incomes: category_hash, total: total }
  end
end
