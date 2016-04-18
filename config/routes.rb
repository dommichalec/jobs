Rails.application.routes.draw do
  get 'jobs' => 'jobs#index'
  get 'companies' => 'companies#index'
end
