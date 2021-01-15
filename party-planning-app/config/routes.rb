Rails.application.routes.draw do
  match '/auth/github/callback', to: 'sessions#create', via: [:get, :post]


  root 'welcome#home'

  	resources :users do
		resources :parties do
			resources :tickets
		end
	end

	get '/parties/most_popular' => 'parties#most_popular'

	resources :parties
	resource :sessions, only: [:new, :create, :destroy]

	get "/signup" => "users#new"

	get '/login' => "sessions#new"
	post '/login' => 'sessions#create'

	post 'logout' => 'sessions#destroy'

end
