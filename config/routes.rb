# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: %i[index show] do
    resource :carts, only: %i[create destroy], module: 'products'
  end

  resources :checkouts, only: [:new]

  namespace :admin do
    resources :products, except: [:show]
  end
end
