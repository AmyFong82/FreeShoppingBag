Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
resources :users do
	resources :parties, only: %i[show index new edit]
end

resources :parties

resources :votes

root "users#home"

get "/signup" => "users#new"

get '/login' => "sessions#new"
post '/login' => 'sessions#create'

post '/logout' => 'sessions#destroy'



end
