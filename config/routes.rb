Rails.application.routes.draw do
  root to: "pages#show"
  resources :users
  resources :leagues, only: [:new, :index, :create, :show] do
    resources :games, controller: "leagues/games"
  end
  resources :participants
  
  get "/dashboard", to: "users#show", as: "dashboard"
  get "/logout", to: "sessions#destroy", as: "logout"
  get "/sign-up-or-in", to: "users#new", as: "sign_up"
end
