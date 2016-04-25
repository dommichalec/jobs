Rails.application.routes.draw do
  resources :users
  resource :session
  root "jobs#index"
  get "sign_up" => "users#new"
  resources :companies do
    resources :jobs
  end
end
