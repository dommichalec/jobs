Rails.application.routes.draw do

  root "jobs#index"
  get "sign_up" => "users#new"

  resource :session
  resources :users do
    resources :companies
  end
  resources :companies do
    resources :jobs
  end
end
