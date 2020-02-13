Rails.application.routes.draw do
  devise_for :users
  root "static_pages#index"
  resources :facts, only: [:new, :create, :index, :show, :destroy] do
    resources :likes
    resources :dislikes
  end
end
