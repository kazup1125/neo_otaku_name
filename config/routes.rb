Rails.application.routes.draw do
  get 'home/top'
  root 'home#top'
  post '/callback' => 'line_bot#callback'

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :otaku_words, only: [:index, :show]
    end
  end
  resources :categories
  resources :otaku_words
end
