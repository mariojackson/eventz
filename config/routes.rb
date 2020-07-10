# frozen_string_literal: true

Rails.application.routes.draw do
  resources :events do
    resources :registrations
  end

  root 'events#index'
end
