class TicketsController < ApplicationController

	def create
		@ticket = Ticket.create(party_id: params[:party_id], user_id: params[:user_id], num_of_attendees: params[:ticket][:num_of_attendees])
		redirect_to user_party_path(current_user, @ticket.party)
	end


	private


end
