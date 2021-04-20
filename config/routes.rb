Rails.application.routes.draw do
  devise_for :customers,:controllers => {
    :sessions => 'public/sessions',
    :registrations => 'public/registrations'
  }
  get '/' => 'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'
  patch 'customers/hide' => 'public/customers#hide'
  get 'customers' => 'public/customers#update'
  get 'customers/edit' => 'public/customers#edit'
  get 'customers/my_page' => 'public/customers#show'
  delete  'cart_items/destroy_all' => 'public/cart_items#destroy_all'
  post 'orders/confirmation' => 'public/orders#confirmation'
  get 'orders/complete' => 'public/orders#complete'
  scope module: :public do
   resources :products,only: [:index,:show]
   resources :cart_items,only: [:index,:create,:update,:destroy]
   resources :orders,only: [:new, :create,:index,:show]
   resources :addresses,only: [:index,:create,:edit,:update,:destroy]
  end

  devise_for :manager,:controllers => {
    :sessions => 'manager/sessions',
    :registrations => 'manager/registrations'
  }
  get 'manager/homes' => 'manager#top'
  patch 'manager/order_products/:id' => 'manager/order_products#update'
  namespace :manager do
  resources :customers,only: [:index, :show, :edit, :update]
  resources :products,only: [:index,:new,:create,:show,:edit,:update]
  resources :genres,only: [:index, :create, :edit, :update]
  resources :orders,only: [:show, :update]
  end
end
