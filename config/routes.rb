Rails.application.routes.draw do

  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # adminログイン後topへ移動
  root 'admin/orders#top'

end
