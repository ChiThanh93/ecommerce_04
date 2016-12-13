Rails.application.routes.draw do
  post "/rate", to: "rater#create", as: "rate"
  devise_for :users,
    controllers: {omniauth_callbacks: "omniauth_callbacks"}

  root "products#index"

  namespace :admin do
    root "charts#index"
    resources :categories
    resources :products
    resources :users
    resources :orders
    resources :suggested_products
    resources :csv, only: :create
    resources :charts, :line_chart
  end


  resources :orders
  resources :products do
    resources :comments
  end

  resources :suggested_products
  resources :categories, only: :show
  resources :favorite_products, only: [:create, :destroy]

  get "/cart", to: "cart#index"
  delete "/cart/:id/delete", to: "cart#destroy"
  post "/cart/:id", to: "cart#create"
  patch "/cart", to: "cart#update"
  get "/cart/:id/edit", to: "cart#edit"

  get "/:page", to: "static_pages#show"
end
