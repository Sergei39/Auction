Rails.application.routes.draw do
  root 'product#index', as: 'home'
  get 'profile' => 'product#profile', as: 'profile'
  get 'participation' => 'product#participation', as: 'participation'
  get 'my_goods' => 'product#my_goods', as: 'my_goods'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
