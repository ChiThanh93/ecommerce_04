Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # devise_scope :user do
  #   get 'sign_in', to: 'devise/sessions#new'
  # end
  root "static_pages#home"

  get "/:page", to: "static_pages#show"
end
