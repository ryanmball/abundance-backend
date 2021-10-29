class CurrentBalancesController < ApplicationController
  def create
    current_balance = CurrentBalance.new(
      checking1: params[:checking1],
      checking2: params[:checking2],
      savings1: params[:savings1],
      savings2: params[:savings2],
      credit_card1: params[:credit_card1],
      credit_card2: params[:credit_card2],
      credit_card3: params[:credit_card3],
      credit_card4: params[:credit_card4],
      net_cash: checking1 + checking2 + savings1 + savings2 - credit_card1 - credit_card2 - credit_card3 - credit_card4
      user_id: current_user.id,
    )
    if current_balance.save
      render json: current_balance         #HAPPY PATH
    else
      render json: { errors: current_balance.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end
end
