Rails.application.routes.draw do
  # Expenses
  get "/expenses" => "expenses#index"
  post "/expenses" => "expenses#create"
  get "/expenses/:id" => "expenses#show"
  patch "/expenses/:id" => "expenses#update"
  delete "/expenses/:id" => "expenses#destroy"
  get "/monthly_expenses" => "expenses#monthly_expenses"
  get "/category_expenses" => "expenses#category_expenses"

  # Incomes
  get "/incomes" => "incomes#index"
  post "/incomes" => "incomes#create"
  get "/incomes/:id" => "incomes#show"
  patch "/incomes/:id" => "incomes#update"
  delete "/incomes/:id" => "incomes#destroy"
  get "/monthly_incomes" => "incomes#monthly_incomes"
  get "/category_incomes" => "incomes#category_incomes"

  # MonthlyBalances
  get "/monthly_balances" => "monthly_balances#index"
  post "/monthly_balances" => "monthly_balances#create"
  get "/monthly_balances/:id" => "monthly_balances#show"
  patch "/monthly_balances/:id" => "monthly_balances#update"
  delete "/monthly_balances/:id" => "monthly_balances#destroy"
  get "/net_cash" => "monthly_balances#net_cash"

  # CurrentBalances
  get "/current_balances" => "current_balances#show"
  post "/current_balances" => "current_balances#create"

  # Calcs
  post "/calcs/net_cash_beginning" => "calcs#net_cash_beginning"
  post "/calcs/net_cash_ending" => "calcs#net_cash_ending"

  # Account creation, login and user profile
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/users/:id" => "users#show"

end
