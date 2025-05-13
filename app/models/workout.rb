class Workout < ApplicationRecord
  # Must have a name and date
  validates :workout_type, presence: true
  validates :date, presence: true

  # Must have either duration or reps (at least one, not both required)
  validate :must_have_duration_or_reps
  
  # add user specificity
  belongs_to :user

  private

  def must_have_duration_or_reps
    if duration.blank? && reps.blank?
      errors.add(:base, "Please provide either duration or reps.")
    end
  end
end
