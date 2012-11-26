Lojas::Application.routes.draw do
  resources :shops

  root to: 'static_pages#home'

  match '/registo', to: 'shops#new'

  match '/contacts', to: 'static_pages#contacts'
end