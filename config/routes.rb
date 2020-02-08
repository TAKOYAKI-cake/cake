Rails.application.routes.draw do
  # admin用loginsessionsのため編集
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # adminログイン後topへ移動
  root 'admin/orders#top'
  # admin/orderのルート設定
   namespace :admin do
   resources :orders, only: [:index, :show, :update]
  end

end
