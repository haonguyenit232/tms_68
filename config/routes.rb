Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#index"
    resources :courses, only: [:index]
  end
  root "static_pages#index"
  devise_for :users
end
