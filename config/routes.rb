Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'otaku_words#index'
  post '/callback' => 'line_bot#callback'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :otaku_words, only: [:index, :show]
    end
  end
  resources :categories, only: [:index, :show]
  resources :otaku_words, only: [:index, :show]
end
