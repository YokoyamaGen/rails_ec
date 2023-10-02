# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'products#index'

  resources :products, only: %i[index show]

  namespace :admin do
    resources :products, except: [:show]
  end
end
