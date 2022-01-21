class BalancesController < ApplicationController
  def index
    render json: Balance.where(user_id: current_user.id).order(:date) 
  end

  def create
    balance = Balance.new(
      month: params[:month],
      year: params[:year],
      date: params[:date],
      account_name: params[:account_name],
      balance: params[:balance],
      type: params[:type],
      accounting_type: params[:accounting_type],
      net_cash_calc: params[:net_cash_calc],
      monthly_balance: params[:monthly_balance],
      user_id: current_user.id,
    )
    balance.date_identifier = "#{balance.month}.#{balance.year}"
    if balance.save
      render json: balance         #HAPPY PATH
    else
      render json: { errors: balance.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end
end
