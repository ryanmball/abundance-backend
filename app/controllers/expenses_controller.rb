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
      recurring: params[:recurring],
      expense_group_id: params[:expense_group_id],
      user_id: current_user.id,
    )
    expense.year = expense.date.year
    expense.month = expense.date.month
    expense.date_identifier = "#{expense.date.month}.#{expense.date.year}"
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
    expense.recurring = params[:recurring] || expense.recurring
    expense.expense_group_id = params[:expense_group_id] || expense.expense_group_id
    expense.year = expense.date.year
    expense.month = expense.date.month
    expense.date_identifier = "#{expense.date.month}.#{expense.date.year}"
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

  def recurring
    recurring_expenses = Expense.where(user_id: current_user.id, recurring: true).pluck(:category, :description).uniq
    render json: recurring_expenses
  end

  def categories
    render json: Expense.where(user_id: current_user.id).map{ |expense| expense[:category] }.uniq.sort
  end

  def category_expenses
    all_expenses = Expense.where(user_id: current_user.id)
    category_hash = Hash.new(0)
    all_expenses.each { |expense| category_hash[expense.category] += expense.amount }
    total = 0
    category_hash.each { |k, v| total += v }
    render json: { category_expenses: category_hash, total: total }
  end

end
