Rails.application.routes.draw do
  get 'dashboard/index'
  devise_for :users
  get 'dashboard', to: 'dashboard#index'
  root to: 'dashboard#index'
  resources :journals do
    resources :mood_options, only: [:new, :create]
  end

  resources :tasks do
    resources :mood_options, only: [:new, :create]
  end
end
