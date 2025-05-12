module WorkoutsHelper
  def current_streak(workouts)
    return 0 if workouts.empty?

    workout_dates = workouts.pluck(:date).uniq.sort.reverse
    today = Date.today

    streak = 0
    workout_dates.each do |date|
      expected_date = today - streak
      break unless date == expected_date

      streak += 1
    end

    streak
  end

  def top_exercises(workouts, limit = 5)
    return [] if workouts.empty?

    grouped = workouts
                .map { |w| w.workout_type&.strip&.downcase }
                .compact
                .tally
                .sort_by { |_, count| -count }

    grouped.first(limit)
  end
end