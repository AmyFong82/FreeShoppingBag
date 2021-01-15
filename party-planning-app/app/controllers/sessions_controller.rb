class SessionsController < ApplicationController
	  skip_before_action :verify_authenticity_token, only: :create

	def new
	end

	def create
		if auth
			@user = User.find_or_create_by(name: auth['info']['name'], email: 'github', phone: auth['info']['phone'])
			session[:user_id] = @user.id
		    current_user = @user
		    redirect_to parties_path
		elsif params[:user][:name]
			user = User.find_by(name: params[:user][:name])
			if user
				if user.authenticate(params[:user][:password])
					session[:user_id] = user.id
					redirect_to user_path(user)
				else
					flash[:alert] = "Password incorrect."
					redirect_to '/login'
				end
			else
				flash[:alert] = "This email is not registered."
				redirect_to '/login'
			end
		end
	end

	def destroy
		session.delete :user_id
		flash[:alert] = "You've successfully logged out."
		redirect_to '/'
	end

	protected

	def auth
	    request.env['omniauth.auth']
	end

end