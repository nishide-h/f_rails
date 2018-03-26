Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }

  root to: "tweets#index"

  resources :users do
    resources :tweets
  end

  get "users/index"
  get "users/show/:id" => "users#show"
end
