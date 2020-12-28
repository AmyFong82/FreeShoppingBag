class PartiesController < ApplicationController

	def new
		# if params[:user_id] && !User.exist?(params[:user_id])
		# 	redirect_to '/login', alert: "User not found."
		if session[:user_id]

		else
			@party = Party.new(user_id: params[:user_id])
		end
	end

	def index
		if params[:user_id]
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
			@party = Party.find(params[:id])
			current_user.parties << @party
			redirect_to user_path(current_user)
		end
	end

	def update
		if params[:user_id]
			@party = Party.find(params[:id])
			@party.users << current_user
			redirect_to user_parties_path(current_user)
		end
	end

	def destroy
		if params[:user_id]
			@party = current_user.parties.find(params[:id])
			current_user.parties.delete(@party)
			redirect_to user_path(current_user)
		end
	end

	private

	def party_params
		params.require(:party).permit(:id, :name, :date, :time, :location, :organizer, :user_id)
	end

end
