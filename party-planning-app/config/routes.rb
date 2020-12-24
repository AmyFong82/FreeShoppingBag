Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users

resources :parties

resources :votes

root "users#home"

get "/signup" => "users#new"

get '/login' => "sessions#create"

post '/logout' => 'sessions#destroy'



end
