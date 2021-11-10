class CalcsController < ApplicationController
  def net_cash_beginning
    monthly_balance = MonthlyBalance.where(user_id: current_user.id).where(year: params[:year]).select { |cy_balance| cy_balance.month == params[:month]}
    selected_month = monthly_balance[0]
    beginning_cash = (selected_month.checking1 + selected_month.checking2 + selected_month.savings1 + selected_month.savings2 - selected_month.credit_card1 - selected_month.credit_card2 - selected_month.credit_card3 - selected_month.credit_card4)
    render json: beginning_cash
  end

  def net_cash_ending
    monthly_balance = MonthlyBalance.where(user_id: current_user.id).where(year: params[:year]).select { |cy_balance| cy_balance.month == params[:month]}
    selected_month = monthly_balance[0]
    beginning_cash = (selected_month.checking1 + selected_month.checking2 + selected_month.savings1 + selected_month.savings2 - selected_month.credit_card1 - selected_month.credit_card2 - selected_month.credit_card3 - selected_month.credit_card4)
    render json: beginning_cash
  end

  def monthly_data
    monthly_balances = MonthlyBalance.where(user_id: current_user.id)
    month_arr = []
    monthly_balances.each do |balance|
      month_hash = Hash.new(0)
      month_hash["month"] = balance.month
      month_hash["year"] = balance.year
      month_hash["net_cash"] += (balance.checking1 + balance.checking2 + balance.savings1 + balance.savings2 - balance.credit_card1 - balance.credit_card2 - balance.credit_card3 - balance.credit_card4)
      month_arr << month_hash
    end

    
  end
  
end
