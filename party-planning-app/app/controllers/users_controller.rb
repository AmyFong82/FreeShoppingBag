class UsersController < ApplicationController
	before_action :require_login, only: [:show]

	def home
		if session[:user_id]
			redirect_to user_parties_path(current_user)
		end
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
		if User.exists?(params[:id]) && current_user == User.find(params[:id])
			@user = User.find(session[:user_id])
			@parties = @user.parties
			if @parties.count == 0
				flash[:alert] = "You have not joined any parties yet. Explore the parties below."
				redirect_to parties_path
			else
				@parties_organized = Party.party_organizer(current_user)
			end
		else
			redirect_to user_path(current_user)
		end
	end


	private

	def user_params
		params.require(:user).permit(:name, :phone, :email, :password)
	end
end
