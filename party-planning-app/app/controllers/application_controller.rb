class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def logged_in?
  	session[:user_id] == params[:id].to_i
  end

  def current_user
  	 User.find(session[:user_id])
  end


  private

	def require_login
		redirect_to '/' unless current_user
	end
end
