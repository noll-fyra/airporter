Rails.application.routes.draw do

  devise_for :users
  root to: 'flights#index'
resources :flights

  post '/book', to: 'users#book'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
