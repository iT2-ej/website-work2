Rails.application.routes.draw do

  get '/top' => 'homes#top'
  root :to => 'homes#top'
  post 'lists' => 'lists#create'
  get 'lists' => 'lists#index'
  get 'lists/: id' => 'lists#show'
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
