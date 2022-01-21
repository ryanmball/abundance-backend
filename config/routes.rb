Rails.application.routes.draw do
  # Expenses
  get "/expenses" => "expenses#index"
  post "/expenses" => "expenses#create"
  get "/expenses/:id" => "expenses#show"
  patch "/expenses/:id" => "expenses#update"
  delete "/expenses/:id" => "expenses#destroy"
  get "/recurring" => "expenses#recurring"
  get "/categories" => "expenses#categories"
  
  # ExpenseGroups
  get "/expense_groups" => "expense_groups#index"
  post "/expense_groups" => "expense_groups#create"
  get "/expense_groups/:id" => "expense_groups#show"
  patch "/expense_groups/:id" => "expense_groups#update"
  delete "/expense_groups/:id" => "expense_groups#destroy"
  
  # Incomes
  get "/incomes" => "incomes#index"
  post "/incomes" => "incomes#create"
  get "/incomes/:id" => "incomes#show"
  patch "/incomes/:id" => "incomes#update"
  delete "/incomes/:id" => "incomes#destroy"
  get "/recurring" => "incomes#recurring"

  # MonthlyBalances
  get "/monthly_balances" => "monthly_balances#index"
  post "/monthly_balances" => "monthly_balances#create"
  get "/monthly_balances/:id" => "monthly_balances#show"
  patch "/monthly_balances/:id" => "monthly_balances#update"
  delete "/monthly_balances/:id" => "monthly_balances#destroy"

  # Balances
  get "/balances" => "balance#index"
  post "/balances" => "balance#create"

  # CurrentBalances
  get "/current_balances" => "current_balances#show"
  post "/current_balances" => "current_balances#create"

  # Calcs
  get "/calcs/monthly_data" => "calcs#monthly_data"

  # Recurring
  get "/recurring_expenses" => "recurring_expenses#index"
  get "/recurring_expenses_names" => "recurring_expenses#names"
  get "/recurring_expenses_totals" => "recurring_expenses#totals"
  get "/recurring_incomes" => "recurring_incomes#index"
  get "/recurring_incomes_names" => "recurring_incomes#names"
  get "/recurring_incomes_totals" => "recurring_incomes#totals"

  # Account creation, login and user profile
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"

  get "/users/:id" => "users#show"

end
