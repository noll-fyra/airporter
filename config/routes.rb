Rails.application.routes.draw do

  root 'flights/index'
  get '/homepage' => 'pages#index'
  get '/about' => 'pages#about_page'
  get '/error_page' => 'pages#error_page'

  resources :flights
  get 'redirect_page' => 'flights#redirect_page'
  # resources :<controller_name>

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
