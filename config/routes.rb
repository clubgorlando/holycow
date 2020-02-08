Rails.application.routes.draw do
  root "static_pages#index"
  resources :facts, only: [:new, :create, :index]
end
