json.extract! workout, :id, :workout_type, :duration, :reps, :notes, :date, :created_at, :updated_at
json.url workout_url(workout, format: :json)
