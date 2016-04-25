Rails.application.routes.draw do
  resources :users
  root "jobs#index"
  resources :companies do
    resources :jobs
  end
end
