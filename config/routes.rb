Myblog::Application.routes.draw do
  root to: 'static_pages#about'

  get "static_pages/about"
  match '/about', to: 'static_pages#about'

end
