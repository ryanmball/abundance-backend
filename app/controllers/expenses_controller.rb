class ExpensesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: Expense.where(user_id: current_user.id).order(:date)
  end

  def create
    expense = Expense.new(
      date: params[:date],
      amount: params[:amount],
      category: params[:category],
      description: params[:description],
      user_id: current_user.id,
    )
    if expense.save
      render json: expense         #HAPPY PATH
    else
      render json: { errors: expense.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: Expense.find(params[:id])
  end

  def update
    expense = Expense.find(params[:id])
    expense.date = params[:date] || expense.date
    expense.amount = params[:amount] || expense.amount
    expense.category = params[:category] || expense.category
    expense.description = params[:description] || expense.description
    if expense.save
      render json: expense         #HAPPY PATH
    else
      render json: { errors: expense.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    expense = Expense.find(params[:id])
    expense.destroy
    render json: { message: "Expense successfully destroyed!"}
  end

  def monthly_totals
    all_expenses = Expense.where(user_id: current_user.id)
    monthly_hash = Hash.new(0)
    all_expenses.each { |expense| monthly_hash[expense.date.to_s[5..6]] += expense.amount}
    total = 0
    monthly_hash.each { |k, v| total += v }
    render json: { monthly_totals: monthly_hash, total: total }
  end

  def category_totals
    all_expenses = Expense.where(user_id: current_user.id)
    category_hash = Hash.new(0)
    all_expenses.each { |expense| category_hash[expense.category] += expense.amount }
    total = 0
    category_hash.each { |k, v| total += v }
    render json: { category_totals: category_hash, total: total }
  end

end
