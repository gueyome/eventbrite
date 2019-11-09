Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :events do
    resources :attendances
    resources :event_pictures, only: [:create]
  end
  resources :users
  #resources :charges
  root 'events#index'
  namespace :admin do
    root 'events#index'
    resources :events, :users
  end
  resources :event_submissions, only: [:index]
end

