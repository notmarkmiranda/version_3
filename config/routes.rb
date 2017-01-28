Rails.application.routes.draw do
  root to: "pages#show"
  resources :users, expect: [:new, :show]
  get "/dashboard", to: "users#show", as: "dashboard"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/sign-up-or-in", to: "users#new", as: "sign_up"
end
