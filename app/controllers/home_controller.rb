class HomeController < ApplicationController
  # before_action :authenticate_user!
  def home 
  end

  def dashboard
  end

  def index
    # dashboard logic
    @workouts = Workout.all
  end
end
