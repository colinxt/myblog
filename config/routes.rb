Myblog::Application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]
  resources :posts

  root to: 'posts#index', defaults: {l: 'eng'}

  match '/about', to: 'static_pages#about'
  match '/jinqu', to: 'sessions#new'
  match '/chulai', to: 'sessions#destroy', via: :delete
  match '/zh', to: 'posts#index', l: 'chn'
end
