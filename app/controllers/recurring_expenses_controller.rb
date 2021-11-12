class RecurringExpensesController < ApplicationController
  def index
    recurring_expenses = RecurringExpense.where(user_id: current_user.id).order(:category)
    render json: recurring_expenses
  end

  def names
    recurring_expenses = RecurringExpense.where(user_id: current_user.id)
    name_hash = Hash.new { |k,v| k[v] = [] }
    recurring_expenses.each { |expense| name_hash[expense.category].push(expense.name) }
    render json: name_hash
  end

  def totals
    recurring_expenses = RecurringExpense.where(user_id: current_user.id)
    category_totals = Hash.new(0)
    recurring_expenses.each { |expense| category_totals[expense.category] += expense.estimate }
    render json: category_totals.to_a.sort_by { |category| -category[1] }
  end
end
