Rails.application.routes.draw do
  get 'tweets/index'

  get 'tweets/show'

  get 'tweets/new'

  get 'users/index'
  get 'users/show/:username' => 'users#show'
end
