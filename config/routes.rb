Myblog::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'static_pages#about'

  get "static_pages/about"
  match '/about', to: 'static_pages#about'

  match '/jinqu', to: 'sessions#new'
  match '/chulai', to: 'sessions#destroy', via: :delete
end
