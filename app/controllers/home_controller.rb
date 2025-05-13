class HomeController < ApplicationController
  allow_unauthenticated_access only: :home
  # before_action :authenticate_user!
  def home 
    # if logged in already go straight to dashboard -- can't go back home 
    redirect_to dashboard_path if authenticated?
  end

  def dashboard
    # if not logged in only go to login page
    redirect_to new_session_path unless authenticated?
  end

  def index
    # dashboard logic
    @workouts = Workout.all
  end
end
