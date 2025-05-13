class WorkoutsController < ApplicationController
  before_action :require_login
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  def index
    @workouts = Current.user.workouts.order(date: :desc)
  end

  def show; end

  def new
    @workout = Current.user.workouts.new
  end

  def create
    @workout = Current.user.workouts.new(workout_params)

    if @workout.save
      redirect_to workouts_path, notice: "Workout successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @workout.update(workout_params)
      redirect_to workouts_path, notice: "Workout updated successfully."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @workout.destroy
    redirect_to workouts_path, notice: "Workout deleted."
  end

  private

  def set_workout
    @workout = Current.user.workouts.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to workouts_path, alert: "Workout not found or you're not authorized."
  end

  def workout_params
    params.require(:workout).permit(:workout_type, :duration, :reps, :notes, :date)
  end
end
