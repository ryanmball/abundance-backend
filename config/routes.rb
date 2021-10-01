Rails.application.routes.draw do
  # Expenses
  get "/expenses" => "expenses#index"
  post "/expenses" => "expenses#create"
  get "/expenses" => "expenses#show"
  patch "/expenses" => "expenses#update"
  delete "/expenses" => "expenses#destroy"

  # Incomes
  get "/incomes" => "incomes#index"
  post "/incomes" => "incomes#create"
  get "/incomes" => "incomes#show"
  patch "/incomes" => "incomes#update"
  delete "/incomes" => "incomes#destroy"

  # MonthlyBalances
  get "/monthly_balances" => "monthly_balances#index"
  post "/monthly_balances" => "monthly_balances#create"
  get "/monthly_balances" => "monthly_balances#show"
  patch "/monthly_balances" => "monthly_balances#update"
  delete "/monthly_balances" => "monthly_balances#destroy"

  # Account creation and login
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

end
