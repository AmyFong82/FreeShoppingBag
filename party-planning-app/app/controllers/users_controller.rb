class UsersController < ApplicationController

	def home
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
 
	    if @user.save
	      redirect user_path(@user)
	    else
	      render :new
	    end
	end


	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :phone, :email, :password)
	end
end
