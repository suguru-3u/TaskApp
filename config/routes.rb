Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  root to: 'tasks#index'
  post '/tasks' , to: 'tasks#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
