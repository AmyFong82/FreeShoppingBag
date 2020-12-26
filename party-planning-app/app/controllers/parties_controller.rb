class PartiesController < ApplicationController
	include PartiesHelper

	def new
		if params[:user_id] && !User.exitst?(params[:user_id])
			redirect_to '/login', alert: "User not found."
		else
			@party = Party.new(user_id: params[:user_id])
		end
	end

	def index
		if params[:user_id]
			@parties = User.find(params[:user_id]).parties
		else
			@parties = Party.all
		end
	end

	def show
		if params[:user_id]
			@party = User.find(params[:user_id]).parties.find(params[:id])
		else
			@party = Party.find(params[:id])
		end
	end

	private

	def party_params
		params.require(:party).permit(:name, :date, :time, :location, :user_id)
	end

end
