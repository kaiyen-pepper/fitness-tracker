class ApplicationController < ActionController::Base
  before_action :set_current_user
  before_action :require_login # Add this line to ensure authentication is checked

  helper_method :authenticated?

  def authenticated?
    Current.user.present?
  end

  private

  def require_login
    unless Current.user
      redirect_to new_session_path, alert: "You must be logged in to access that page."
    end
  end

  def set_current_user
    if session[:user_id]
      Current.user = User.find_by(id: session[:user_id])
    end
  end
  
end
