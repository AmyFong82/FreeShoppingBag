Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
	resources :users do
		resources :parties do
			resources :tickets
		end
	end

	get '/parties/most_popular' => 'parties#most_popular'

	resources :parties

	root "users#home"

	get "/signup" => "users#new"

	get '/login' => "sessions#new"
	post '/login' => 'sessions#create'

	post '/logout' => 'sessions#destroy'

	match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
end
