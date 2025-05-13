class CalendarController < ApplicationController
  def index
    @workouts = Workout.all.order(date: :asc)
  end
end
