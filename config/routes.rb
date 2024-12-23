Rails.application.routes.draw do
  devise_for :users
  root to: 'journals#index'
  resources :journals do
    resources :mood_options, only: [:new, :create]
  end

  resources :tasks do
    resources :mood_options, only: [:new, :create]
  end
end
