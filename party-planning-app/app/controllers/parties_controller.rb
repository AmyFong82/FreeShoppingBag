class PartiesController < ApplicationController

	def new
		if params[:user_id] && !User.exitst?(params[:user_id])
			redirect_to '/login', alert: "User not found."
		else
			@party = Party.new(user_id: params[:user_id])
		end
	end

	def index
		if logged_in? && params[:user_id]
			if current_user.parties.count == 0
				@parties = Party.all
			else
				@parties = current_user.parties
			end
		else
			@parties = Party.all
		end
	end

	def show
		if params[:user_id] 
			@party = current_user.parties.find(params[:id])
		else
			@party = Party.find(params[:id])
		end
	end

	def create
		if logged_in?
			@party = Party(params[:id])
			current_user.parties << @party
			redirect_to user_parties_path(current_user)
		end
	end

	def destroy
		if logged_in?
			@party = current_user.parties.find(params[:id])
			current_user.parties.delete(@party)
			redirect_to user_path(current_user)
		end
	end

	private

	def party_params
		params.require(:party).permit(:name, :date, :time, :location, :user_id)
	end

end
