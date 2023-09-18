Rails.application.routes.draw do

    root to: 'public/homes#top'
    get '/about' => 'public/homes#about', as:'about'


  namespace :admin do
    resources :orders, only: [:show, :index]
  end
  namespace :admin do
    resources :customers, only: [:index, :show, :edit, :update]
  end
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end
  namespace :admin do
    get '/admin' => 'homes#top'
  end

    get '/orders/new', to:'public/orders#new'
    post '/orders/confirm', to:'public/ordres#confirm'
    get '/orders/complete', to:'public/orders#complete'
    post '/orders', to:'public/orders#create'
    get '/orders', to:'public/orders#index'
    get '/orders/:id', to:'public/orders#show'


    get '/cart_items', to:'public/cart_items#show'
    patch '/cart_items/:id', to:'public/cart_items#update'
    delete '/cart_items/:id', to:'public/cart_items#destroy'
    delete '/cart_items/destroy_all', to:'public/cart_items#destroy_all'
    post '/cart_items', to:'public/cart_items#create'


    get '/customers/show', to:'public/customers#show'
    get '/customers/information/edit', to:'public/customers#edit'
    patch '/customers/update', to:'public/customers#update'
    get '/customers/unsubscribe', to:'public/customers#unsubscribe'
    patch '/customers/withdraw', to:'public/customers#withdraw'


    resources :public_items, only: [:index, :show]


  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
