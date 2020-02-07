Rails.application.routes.draw do
  root "static_pages#index"
  resources :facts do
  end
end
