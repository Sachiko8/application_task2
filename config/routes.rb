Rails.application.routes.draw do

  root :to => 'tops#show'

  devise_for :users
  resources :users, only:[:index,:show,:edit,:update]
  get "/users" => "users#top", as: "user_top"
  root 'users#top'

  resources :books

  get "/top" => "tops#show", as: "top"
  get "/about" => "tops#index", as: "about"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
