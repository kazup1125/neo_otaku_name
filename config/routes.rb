# frozen_string_literal: true

Rails.application.routes.draw do
  get 'home/top'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'home#top'
  post '/callback' => 'line_bot#callback'

  namespace :api, { format: 'json' } do
    namespace :v1 do
      resources :otaku_words, only: %i[index show]
    end
  end
  resources :categories, only: %i[index show]
  resources :otaku_words, only: %i[index show]
end
