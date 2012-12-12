Lojas::Application.routes.draw do
  get "cities/new"

  resources :shops
  resources :categories
  resources :cities

  root to: 'static_pages#home'

  match '/registo', to: 'shops#new'
  match '/shops', to: 'shops#index'
  match '/regcat', to: 'categories#new'
  match '/categorias', to: 'categories#index'
  match '/regcity', to: 'cities#new'
  match '/cities', to: 'cities#index'

  match '/contacts', to: 'static_pages#contacts'
end