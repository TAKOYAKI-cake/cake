Rails.application.routes.draw do
  devise_for :admins
  devise_for :customers


root to: 'customers#top'
#customerのルーティング
resources :addresses
resources :carts
resources :products
resources :orders
resources :customers, only: [:show, :edit, :update, :confirm]

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, only: [:show, :index, :edit, :update, :new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # admin/orderのルート設定
   namespace :admin do
    get '/orders/top'
   resources :orders, only: [:index, :show, :update]
   resources :customers, only: [:index, :show, :edit, :update]
end



end
