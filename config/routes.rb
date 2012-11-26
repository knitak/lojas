Lojas::Application.routes.draw do
  get "shops/new"

  root to: 'static_pages#home'

  match '/registo', to: 'shops#new'

  match '/contacts', to: 'static_pages#contacts'
end