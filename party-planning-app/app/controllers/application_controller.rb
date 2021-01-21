class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?, :require_login, :right_user?


  def logged_in?
  	session[:user_id]
  end

  def current_user
    if logged_in?
  	 User.find(session[:user_id])
    end
  end

  def right_user_by_user_id?
    redirect_to user_path(current_user) unless params[:user_id] == current_user.id.to_s
  end

  def right_user_by_id?
    redirect_to user_path(current_user) unless params[:id] == current_user.id.to_s
  end

	def require_login
		redirect_to '/login' unless current_user
	end

end
