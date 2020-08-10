# frozen_string_literal: true

Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    resources :registrations
  end

  resource :session, only: [:new, :create, :destroy]
  get 'signin' => 'sessions#new'

  resources :users
  get 'signup' => 'users#new'
end
