Rails.application.routes.draw do
  resources :companies do
    resources :claims, only: [:create, :destroy, :edit, :update]
    end
    devise_for :admin_users, ActiveAdmin::Devise.config
    ActiveAdmin.routes(self)
    devise_for :users
    root 'companies#index'
end