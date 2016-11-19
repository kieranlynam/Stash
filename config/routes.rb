Rails.application.routes.draw do
  get 'pages/home'

  get 'pages/dashboard'

  get 'pages/retailers'

  get 'pages/card'

  get 'oauth/callback'

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
