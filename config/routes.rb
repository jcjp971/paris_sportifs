Rails.application.routes.draw do
  resources :matches, only: %i[index]
  resources :pronostics, only: %i[index]
  resources :championships, only: %i[index]
  resources :teams, only: %i[index]
  resources :recommendations, only: %i[index]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
