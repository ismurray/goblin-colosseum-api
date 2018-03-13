# frozen_string_literal: true

Rails.application.routes.draw do
  resources :games, except: %i[new edit]
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'
  patch '/gold-transaction/:amount' => 'users#gold_transaction'

  get '/high-scores/:range' => 'games#high_scores'
end
