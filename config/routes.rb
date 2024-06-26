# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: %i[index show] do
    resource :carts, only: %i[create destroy], module: 'products'
  end

  resources :promotion_codes, only: %i[create]
  resources :checkouts, only: %i[index show new create]
  namespace :admin do
    resources :products, except: [:show]
  end
end
