Rails.application.routes.draw do
  devise_for :users

  authenticated :user do
    root 'schedules#index', as: :authenticated_root
  end

  root 'home#index'
end
