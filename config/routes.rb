Rails.application.routes.draw do
  root to: 'customers#top'
  get 'customers/show'
  get 'customers/edit'
  get 'customers/confirm'
  devise_for :admins
  devise_for :customers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
