class TicketsController < ApplicationController

	def create
		@ticket = Ticket.create(party_id: params[:party_id], user_id: params[:user_id], num_of_attendees: params[:num_of_attendees])
		redirect_to user_party_path
	end


	private


end
