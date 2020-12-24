class SessionsController < ApplicationController

	def new
	end

	def create
		@user = User.find_by(email: params[:user][:email])
		if @user
			if @user.authenticate(params[:user][:password])
				session[:user_id] = @user.id
				redirect_to user_path(@user)
			else
				flash[:alert] = "Password incorrect."
				redirect_to '/login'
			end
		else
			flash[:alert] = "This email is not registered."
			redirect_to '/login'
		end
	end

	def destroy
		session.delete :user_id
		redirect_to '/'
	end

end