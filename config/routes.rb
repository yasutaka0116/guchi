Rails.application.routes.draw do

  devise_for :users
  root 'requests#index'

  get 'requests/lithen'  => 'requests/lithen#index'
  get 'requests/grumbl'  => 'requests/grumbl#index'

  resources :requests

  # get 'requests/new'  => 'requests#new'
  # post 'requests/create'  => 'requests#create'

  # get 'requests/:id'  => 'requests#show'


  get 'users/mypage'  => 'users#mypage'



end
