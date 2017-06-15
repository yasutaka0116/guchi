Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  root 'requests#index'

  get 'terms' => 'home#terms'
  get 'privacy' => 'home#privacy'
  get 'contact' => 'home#contact'
  get 'requests/lithen'  => 'requests#lithen'
  get 'requests/grumbl'  => 'requests#grumbl'
  get 'requests/today'  => 'requests#today'
  resources :requests, only: [:index, :new, :create, :show]
  resources :accepts, only: [:create, :index, :update]
  resources :talks, only: [:show]
  resources :rooms, only: [:index]
  resources :users, only: [:show]

  get 'rooms/:id/talks'  => 'talks#show' , as: 'talks_show'
  post 'rooms/:id/talks/post' => 'talks#post'

end
