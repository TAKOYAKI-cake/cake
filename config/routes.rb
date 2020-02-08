Rails.application.routes.draw do
  namespace :admin do
    get 'genres/index'
    get 'genres/create'
    get 'genres/edit'
    get 'genres/update'
  end
  namespace :admin do
    get 'products/index'
    get 'products/show'
    get 'products/new'
    get 'products/create'
    get 'products/edit'
    get 'products/update'
  end
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
