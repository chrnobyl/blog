Rails.application.routes.draw do
  # resources :post_tags, only: [:create, :destroy]
  # resources :tags, only: [:create, :destroy]
  # resources :comments
  resources :posts, except: :index
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # root to: 'posts#index'
  get '/login', to: 'sessions#new', as: 'new_session'
  post '/login', to: 'sessions#create', as: 'login'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  get '/', to: 'posts#index'

end
