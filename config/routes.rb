Lojas::Application.routes.draw do
  resources :shops
  resources :sessions, only: [:new]

  root to: 'static_pages#home'

  match '/registo', to: 'shops#new'
  match '/pesquisa', to: 'sessions#new'

  match '/contacts', to: 'static_pages#contacts'
end