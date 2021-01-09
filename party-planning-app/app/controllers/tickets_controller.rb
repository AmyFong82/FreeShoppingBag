class TicketsController < ApplicationController

	def create
		if logged_in?
			@ticket = Ticket.create(party_id: params[:party_id], user_id: params[:user_id], num_of_attendees: params[:ticket][:num_of_attendees])
			redirect_to user_party_path(current_user, @ticket.party)
		end
	end

	def update
		if logged_in?
			@ticket = Ticket.find_by(user_id: params[:user_id], party_id: params[:party_id])
			@ticket.update(num_of_attendees: params[:ticket][:num_of_attendees])
			redirect_to user_party_path(current_user, @ticket.party)
		end
	end



end
