class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def logged_in?
  	session[:user_id] == params[:id]
  end

  def current_user
    if session[:user_id]
  	 User.find(session[:user_id])
    end
  end

  private

	def require_login
		redirect_to '/' unless current_user
	end
end
