Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do

    get 'session/login'
    get 'session/create'
    get 'session/logout'
    resources :users
    root 'page#index', as: 'home'
    get 'profile' => 'page#profile', as: 'profile'
    get 'participation' => 'page#participation', as: 'participation'
    get 'my_goods' => 'page#my_goods', as: 'my_goods'
    get 'add' => 'page#add', as: 'add'
    post 'raise' => 'descriptions#raise', as: 'raise'

    get 'login' => 'session#login', as: 'login'
    post 'session/create', as: 'session'
    get 'logout' => 'session#logout', as: 'logout'

    resources :product
    resources :descriptions, as: 'descriptions'
    resources :reviews, as: 'reviews'
    resources :users
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
