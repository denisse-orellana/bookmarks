Rails.application.routes.draw do
  root 'bookmarks#index'
  resources :bookmarks
  resources :types
  resources :categories
  get '/endpoint/:id', to: 'categories#endpoint', as: 'endpoint'
  get '/home', to: 'home#index', as: 'home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
