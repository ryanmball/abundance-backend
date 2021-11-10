class MonthlyBalancesController < ApplicationController
  before_action :authenticate_user

  def index
    render json: MonthlyBalance.where(user_id: current_user.id).order(:month)
  end

  def create
    monthly_balance = MonthlyBalance.new(
      month: params[:month],
      year: params[:year],
      checking1: params[:checking1],
      checking2: params[:checking2],
      savings1: params[:savings1],
      savings2: params[:savings2],
      credit_card1: params[:credit_card1],
      credit_card2: params[:credit_card2],
      credit_card3: params[:credit_card3],
      credit_card4: params[:credit_card4],
      loan1: params[:loan1],
      loan2: params[:loan2],
      personal_IRA: params[:personal_IRA],
      user_id: current_user.id,
    )
    monthly_balance.date_identifier = "#{monthly_balance.month}.#{monthly_balance.year}"
    if monthly_balance.save
      render json: monthly_balance         #HAPPY PATH
    else
      render json: { errors: monthly_balance.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def show
    render json: MonthlyBalance.find(params[:id])
  end

  def update
    monthly_balance = MonthlyBalance.find(params[:id])
    monthly_balance.month = params[:month] || monthly_balance.month
    monthly_balance.year = params[:year] || monthly_balance.year
    monthly_balance.checking1 = params[:checking1] || monthly_balance.checking1
    monthly_balance.checking2 = params[:checking2] || monthly_balance.checking2
    monthly_balance.savings1 = params[:savings1] || monthly_balance.savings1
    monthly_balance.savings2 = params[:savings2] || monthly_balance.savings2
    monthly_balance.credit_card1 = params[:credit_card1] || monthly_balance.credit_card1
    monthly_balance.credit_card2 = params[:credit_card2] || monthly_balance.credit_card2
    monthly_balance.credit_card3 = params[:credit_card3] || monthly_balance.credit_card3
    monthly_balance.credit_card4 = params[:credit_card4] || monthly_balance.credit_card4
    monthly_balance.loan1 = params[:loan1] || monthly_balance.loan1
    monthly_balance.loan2 = params[:loan2] || monthly_balance.loan2
    monthly_balance.personal_IRA = params[:personal_IRA] || monthly_balance.personal_IRA
    if monthly_balance.save
      render json: monthly_balance         #HAPPY PATH
    else
      render json: { errors: monthly_balance.errors.full_messages }, status: :unprocessable_entity       #SAD PATH
    end
  end

  def destroy
    monthly_balance = MonthlyBalance.find(params[:id])
    monthly_balance.destroy
    render json: { message: "Monthly balance successfully destroyed!"}
  end

end
