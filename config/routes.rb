Rails.application.routes.draw do
  get '/auth/:provider/callback', controller: :omniauth_callbacks, action: 'all_providers'

  resources :users, only: [:edit, :update]

  root 'welcome#show'
end
