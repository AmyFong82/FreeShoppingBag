class SessionsController < ApplicationController
	  skip_before_action :verify_authenticity_token, only: :create

	def new
	end

	def create
		if params[:user][:email]
			user = User.find_by(email: params[:user][:email])
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
		else
			@user = User.find_or_create_by(email: auth['info']['email'], 
					first_name: auth['info']['name'][0])
			session[:user_id] = @user.id
		    self.current_user = @user
		    redirect_to parties_path
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