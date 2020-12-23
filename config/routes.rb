Rails.application.routes.draw do
  root 'page#index', as: 'home'
  get 'profile' => 'page#profile', as: 'profile'
  get 'participation' => 'page#participation', as: 'participation'
  get 'my_goods' => 'page#my_goods', as: 'my_goods'

  resources :product
  resources :descriptions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
