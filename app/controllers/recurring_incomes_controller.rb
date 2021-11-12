class RecurringIncomesController < ApplicationController
  def index
    recurring_incomes = RecurringIncome.where(user_id: current_user.id).order(:category)
    render json: recurring_incomes
  end

  def names
    recurring_incomes = RecurringIncome.where(user_id: current_user.id)
    name_hash = Hash.new { |k,v| k[v] = [] }
    recurring_incomes.each { |income| name_hash[income.category].push(income.name) }
    render json: name_hash
  end

  def totals
    recurring_incomes = RecurringIncome.where(user_id: current_user.id)
    category_totals = Hash.new(0)
    recurring_incomes.each { |income| category_totals[income.category] += income.estimate }
    render json: category_totals.to_a.sort_by { |category| -category[1] }
  end
end
