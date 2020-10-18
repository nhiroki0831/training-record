Rails.application.routes.draw do
  devise_for :users
  root to: "customers#index"
  resources :customers do
    resources :trainings, only: [:index, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
