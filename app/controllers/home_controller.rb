class HomeController < ApplicationController
  # before_action :authenticate_user!

  def index
    # dashboard logic
    @workouts = Workout.all
  end
end
