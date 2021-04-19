Rails.application.routes.draw do
  devise_for :customers,:controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }
  get '/' => 'homes#top'
  get 'about' => 'homes#about'
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/hide' => 'customers#hide'
  get 'customers' => 'customers#update'
  get 'customers/edit' => 'customers#edit'
  get 'customers/my_page' => 'customers#show'
  resources :products,only: [:index,:show]
  resources :cart_items,only: [:index,:create,:update,:destroy]
  delete  'cart_items/destroy_all' => 'cart_items#destroy_all'
  post 'orders/confirmation' => 'orders#confirmation'
  get 'orders/complete' => 'orders#complete'
  resources :orders,only: [:new, :create,:index,:show]
  resources :addresses,only: [:index,:create,:edit,:update,:destroy]

  devise_for :managers,:controllers => {
    :sessions => 'manager/sessions',
    :registrations => 'manager/registrations'
  }
  get 'managers/homes' => 'manager#top'
  patch 'managers/order_products/:id' => 'manager/order_products#update'
  namespace :manager do
  resources:customers,only:[:index, :show, :edit, :update]
  resources:products,only:[:index, :new, :create,  :show, :edit, :update]
  resources:genres,only:[:index, :create, :edit, :update]
  resources:orders,only:[:show, :update]
  end


end
