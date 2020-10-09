Rails.application.routes.draw do
  devise_for :users
  root to: "customers#index"
  resources :customers, only: [:index, :new]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
