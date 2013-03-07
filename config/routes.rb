Myblog::Application.routes.draw do
  get "static_pages/about"
  root to: 'static_pages#about'

  # match '/about', to: 'static_pages#about'
  
end
