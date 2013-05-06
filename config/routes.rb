Myblog::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts
  get 'tags/:tag', to: 'posts#index', as: :tag

  root to: 'posts#index'

  match '/about', to: 'static_pages#about'
  match '/jinqu', to: 'sessions#new'
  match '/chulai', to: 'sessions#destroy', via: :delete
end
