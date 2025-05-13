class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]  # Skip login requirement for these actions
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
  end

  def create
    # Authenticate the user based on the provided email and password
    if user = User.authenticate_by(params.permit(:email_address, :password))
      session[:user_id] = user.id  # Start a new session by storing the user_id
      redirect_to dashboard_path
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    session[:user_id] = nil  # Log out by clearing the session
    redirect_to root_path  # Redirect to the home page
  end
end