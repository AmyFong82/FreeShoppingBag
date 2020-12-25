class PartiesController < ApplicationController

	def new
	end

	def index
		@parties = Party.all
	end

	def show
		@party = Party.find(params[:id])
	end

	
end
