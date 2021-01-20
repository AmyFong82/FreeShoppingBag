class PartiesController < ApplicationController

	def new
		if params[:user_id] && !User.exists?(params[:user_id])
			redirect_to '/login', alert: "User not found."
		elsif session[:user_id]
			@user = current_user
		end
		@party = Party.new
		@ticket = Ticket.new
	end

	def index
		@parties = Party.all

		if !params[:category].blank?
	      @parties = Party.by_category(params[:category])
	      if @parties.count == 0
	      	flash[:notice] = "There are no parties in this category yet."
	      else
	      	flash[:notice] = Category.find(params[:category]).name
	      end
	 	end

	end

	def most_popular
		@party = Party.most_popular
		@ticket = Ticket.new
		render "show"
	end

	def show
		if params[:user_id] 
			@party = current_user.parties.find(params[:id])
			@ticket = Ticket.find_by(party_id: @party.id, user_id: current_user.id)
			@num_of_attendees = @ticket.num_of_attendees
			if @party == nil
				flash[:alert] = "You have not joined this party."
				redirect_to party_path(params[:id])
			end
		else
			@party = Party.find(params[:id])
			@ticket = Ticket.new
		end
	end

	def create
		if logged_in?
			@party = Party.new(party_params)
			if @party.save
				@ticket = Ticket.create(party_id: @party.id, user_id: current_user.id, num_of_attendees: 1)
				redirect_to party_path(@party)
			else
				render :new
			end
		end
	end

	def edit
		if logged_in? && current_user == User.find(params[:user_id])
			@party = Party.find(params[:id])
		end
	end

	def update
		if logged_in?
			@party = Party.find(params[:id])
			@party.update(party_params)
			redirect_to user_party_path(current_user, @party)
		end
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
