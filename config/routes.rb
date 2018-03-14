Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  root to: "tweets#index"
  get "tweets/index"
  get "tweets/show"
  get "tweets/new"
  post "tweets" => "tweets#create"

  get "users/index"
  #get "users/show/:username" => "users#show"
  get "users/show/:id" => "users#show"
end
