Rails.application.routes.draw do
  get '/auth/:provider/callback', controller: :omniauth_callbacks, action: 'all_providers'

  root 'welcome#show'
end
