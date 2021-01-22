class WelcomeController < ApplicationController
  def home
	if session[:user_id]
		redirect_to user_path(current_user)
	end
  end
end
