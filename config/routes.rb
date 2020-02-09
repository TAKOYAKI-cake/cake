Rails.application.routes.draw do

#customerのルーティング
resources :addresses

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products, only: [:show, :index, :edit, :update, :new, :create]
  end

  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  # admin/orderのルート設定
   namespace :admin do
    get '/orders/top'
   resources :orders, only: [:index, :show, :update]
end



end
