Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users

  root to: 'dashboard#index'
  resources :journals do
    resources :mood_options, only: [:new, :create]
  end

  resources :tasks do
    resources :mood_options, only: [:new, :create]
    patch :complete, on: :member, action: :update_status
  end
end