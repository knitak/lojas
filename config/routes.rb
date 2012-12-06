Lojas::Application.routes.draw do
  resources :shops
  resources :categories

  root to: 'static_pages#home'

  match '/registo', to: 'shops#new'
  match '/shops', to: 'shops#index'
  match '/regcat', to: 'categories#new'
  match '/categorias', to: 'categories#index'

  match '/contacts', to: 'static_pages#contacts'
end