class AccountsController < ApplicationController
  def index
    render json: Account.where(user_id: current_user.id).sort(:type)
  end

  def create
    account = Account.new(
      name: params[:name],
      account_identifier: params[:account_identifier],
      description: params[:description],
      account_type: params[:account_type],
      accounting_type: params[:accounting_type],
      net_cash_calc: params[:net_cash_calc],
      user_id: current_user.id,
    )
    if account.save
      render json: account         #HAPPY PATH
    else
      render json: { errors: account.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end
end
