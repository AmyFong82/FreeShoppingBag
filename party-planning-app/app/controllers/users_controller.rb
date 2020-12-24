class UsersController < ApplicationController


	def home
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
 
	    if @user.save
	      session[:user_id] = @user.id
	      redirect_to user_path(@user)
	    else
	      render :new
	    end
	end

	def show
		if logged_in?
			binding.pry
			@user = User.find(session[:user_id])
			@parties = @user.parties
		else
			redirect_to '/'
		end
	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone, :email, :password)
	end
end
