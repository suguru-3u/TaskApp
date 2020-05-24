Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'homes/about'
  get 'mypages/index'
  resources :tasks, only: [:new,:index,:create,:edit,:update,:destroy]
  resources :users, only: [:index,:edit,:update,:destroy]
  resources :groups, only: [:new, :create, :edit, :update,:show,:destroy] do
    resources :projects, only: [:create, :edit, :update,:show,:destroy]
  end

  namespace :admin do
    resources :users, only: [:index,:show,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
