class CalcsController < ApplicationController
  
  def monthly_data
    monthly_balances = MonthlyBalance.where(user_id: current_user.id)
    month_arr = []
    monthly_balances.each do |balance|
      month_hash = Hash.new(0)
      month_hash[:date_identifier] = balance.date_identifier
      month_hash[:beginning_net_cash] += (balance.checking1 + balance.checking2 + balance.savings1 + balance.savings2 - balance.credit_card1 - balance.credit_card2 - balance.credit_card3 - balance.credit_card4)
      month_arr << month_hash
    end

    all_expenses = Expense.where(user_id: current_user.id)
    expenses_hash = Hash.new(0)
    all_expenses.each { |expense| expenses_hash[expense.date_identifier] += expense.amount}

    all_incomes = Income.where(user_id: current_user.id)
    incomes_hash = Hash.new(0)
    all_incomes.each { |income| incomes_hash[income.date_identifier] += income.amount}

    month_arr.each do |month|
      month[:expenses] = expenses_hash[month[:date_identifier]]
      month[:incomes] = incomes_hash[month[:date_identifier]]
      month[:ending_net_cash] = month[:beginning_net_cash] - month[:expenses] + month[:incomes]
    end

    render json: month_arr
  end
  
end
