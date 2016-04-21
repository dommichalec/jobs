Rails.application.routes.draw do
  root "jobs#index"
  resources :companies do
    resources :jobs
  end
end
