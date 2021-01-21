class PartiesController < ApplicationController

	before_action :require_login
  	skip_before_action :require_login, only: [:index, :most_popular, :show]

	def new
		if User.find(params[:user_id]) == current_user
			@user = current_user
			@party = Party.new
			@ticket = Ticket.new
		else
			flash[:alert] = "You're redirected back to your party page."
			redirect_to user_path(current_user)
		end
	end

	def index
		if params[:user_id] && right_user_by_id?
			@parties = Party.all
		else
			@parties = Party.all
		end

		if !params[:category].blank?
	      @parties = Party.by_category(params[:category])
	 	end

	end

	def most_popular
		@party = Party.most_popular
		@ticket = Ticket.new
		render "show"
	end

	def show
		if logged_in?
			if User.find(params[:user_id]) == current_user
				@party = current_user.parties.find(params[:id])
				@ticket = Ticket.find_by(party_id: @party.id, user_id: current_user.id)
				@num_of_attendees = @ticket.num_of_attendees				
				if @party == nil
					flash[:alert] = "You have not joined this party."
					redirect_to party_path(params[:id])
				end
			else
				redirect_to user_path(current_user)
			end
		else
			@party = Party.find(params[:id])
			@ticket = Ticket.new
		end
	end

	def create
		@party = Party.new(party_params)
		if @party.save
			@ticket = Ticket.create(party_id: @party.id, user_id: current_user.id, num_of_attendees: 1)
			redirect_to user_party_path(current_user, @party)
		else
			render :new
		end
	end

	def edit
		if current_user == User.find(params[:user_id])
			@party = Party.find(params[:id])
		end
	end

	def update
		@party = Party.find(params[:id])
		@party.update(party_params)
		redirect_to user_party_path(current_user, @party)
	end

	def destroy
		if params[:user_id]
			@party = current_user.parties.find(params[:id])
			current_user.parties.delete(@party)
			flash[:alert] = "You just gave up a ticket to this party."
			redirect_to party_path(@party)
		else
			@party = Party.find(params[:id])
			tickets = Ticket.where(party_id: @party.id)
			Ticket.delete(tickets)
			Party.delete(@party)
			flash[:alert] = "You have successfully cancelled #{@party.name}."
			redirect_to user_path(current_user)
		end
	end

	private

	def party_params
		params.require(:party).permit(:id, :name, :date, :time, :location, :organizer, :users, :description, :category_name, :max_num_of_attendees)
	end

end
