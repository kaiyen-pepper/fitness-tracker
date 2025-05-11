module WorkoutsHelper
  def workout_days_this_week(workouts)
    start_of_week = Date.today.beginning_of_week(:sunday)
    end_of_week = start_of_week + 6

    days = (start_of_week..end_of_week).to_a

    # Create a set of workout dates
    workout_dates = workouts.where(date: start_of_week..end_of_week).pluck(:date).to_set

    days.map do |day|
      { date: day, worked_out: workout_dates.include?(day) }
    end
  end
end