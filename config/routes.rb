Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#index"
  end
  root "static_pages#index"
  devise_for :users
end
