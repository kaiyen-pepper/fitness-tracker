class HomeController < ApplicationController
  skip_before_action :require_login, only: :home  # Skip authentication for the home action

  def home
    # If the user is logged in, redirect to dashboard
    redirect_to dashboard_path if Current.user
  end

  def dashboard
    # If the user is not logged in, redirect to login page
    redirect_to new_session_path unless Current.user

    # Fetch workouts only for the current user
    @workouts = Current.user.workouts.order(date: :desc)
  end

  def index
    # Fetch workouts only for the current user
    @workouts = Current.user.workouts.order(date: :desc)
  end
end