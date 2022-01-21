class BalancesController < ApplicationController
  def index
    render json: Balance.where(user_id: current_user.id)
  end

  def create
    balance = Balance.new(
      month: params[:month],
      year: params[:year],
      amount: params[:amount],
      account_id: params[:account_id],
    )
    balance.date_identifier = "#{balance.month}.#{balance.year}"
    if balance.save
      render json: balance         #HAPPY PATH
    else
      render json: { errors: balance.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end
end
