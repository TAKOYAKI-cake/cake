Rails.application.routes.draw do
  namespace :admin do
    get 'orderd_products/update'
  end
  devise_for :admins
  devise_for :customers


root to: 'customers#top'
get '/products_genre/:id' => 'products#genre',as:'product_genre'
get 'congfirm' => 'customers#confirm'
get 'orders/thanks' => 'orders#thanks'
delete "/cart" => "carts#destroy_all",as:"carts_destroy_all"
#customerのルーティング
resources :addresses
resources :carts
resources :products

resources :orders do
  post :confirm, action: :confirm_new, on: :new
  end

resources :customers, only: [:show, :edit, :update, :destroy]

  namespace :admin do
    get '/orders/all' => 'orders#all', as: 'orders_all'
    resources :products, only: [:show, :index, :edit, :update, :new, :create]
    resources :genres, only: [:index, :create, :edit, :update]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # admin/orderのルート設定
   namespace :admin do
    get '/orders/top'
   resources :orders, only: [:index, :show, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orderd_products, only: [:update]
end

end
