Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'schedules#index', as: :authenticated_root
  end

  resources :schedules, only: [:index, :update, :create, :destroy]

  root 'home#index'
end
