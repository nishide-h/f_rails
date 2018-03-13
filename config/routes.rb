# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "tweets#index"
  get "tweets/index"
  get "tweets/show"
  get "tweets/new"
  post "tweets" => "tweets#create"

  get "users/index"
  get "users/show/:username" => "users#show"
end
