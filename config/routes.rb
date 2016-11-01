Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root "home#index"

  devise_for :users

  get 'users/show_cart'
  delete 'users/delete_from_cart'

  resources :products do
    resources :reviews
    member do
      post :add_to_cart
    end
  end

  resources :orders, only: [:create, :new]

end
