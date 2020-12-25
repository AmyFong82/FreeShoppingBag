class PartiesController < ApplicationController

	def new
	end

	def index
		@parties = Party.all
	end
end
