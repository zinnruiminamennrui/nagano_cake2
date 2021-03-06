Rails.application.routes.draw do
  get 'customers/edit' => 'public/customers#edit'
  patch 'customers' => 'public/customers#update'
  devise_for :customers,:controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }
  root to: 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  put 'customers/hide' => 'public/customers#hide'
  get 'customers/my_page' => 'public/customers#show'
  delete  'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'orders/confirmation' => 'public/orders#confirmation'
  get 'orders/confirmation' => 'public/orders#confirmation'
  # ↑追記↑
  get 'orders/complete' => 'public/orders#complete'
  scope module: :public do
   resources :products,only: [:index,:show]
   resources :cart_items,only: [:index,:create,:update,:destroy]
   resources :orders,only: [:new, :create,:index,:show]
   resources :addressees,only: [:index,:create,:edit,:update,:destroy]
  end

  devise_for :manager,:controllers => {
    :sessions => 'manager/sessions',
    :registrations => 'manager/registrations'
  }
  get 'manager/homes' => 'manager/homes#top'
  patch 'manager/order_products/:id' => 'manager/order_products#update'
  namespace :manager do
  resources :customers,only: [:index, :show, :edit, :update]
  resources :products,only: [:index,:new,:create,:show,:edit,:update]
  resources :genres,only: [:index, :create, :edit, :update]
  resources :orders,only: [:show, :update]
  resources :order_products,only: [:update]
  end
end
