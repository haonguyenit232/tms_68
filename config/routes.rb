Rails.application.routes.draw do

  namespace :admin do
    root "static_pages#index"
    resources :courses, only: [:index, :new, :create]
    resources :subjects
    resources :users, except: :show
  end
  root "static_pages#index"
  devise_for :users
  resources :user_courses
end
