class DietEntriesController < ApplicationController
  # Uncomment this if you're using Devise or similar
  # before_action :authenticate_user!
  before_action :set_diet_entry, only: [:edit, :update]

  def index
    user = User.first
    @diet_entries = user.diet_entries.order(consumed_at: :desc)
  
    today_entries = @diet_entries.select { |e| e.consumed_at.to_date == Date.today }
  
    # Example targets – you can replace with user settings later
    @targets = { calories: 2000, protein: 120, carbs: 250, fat: 70 }
  
    @summary = {
      calories: today_entries.sum(&:calories),
      protein: today_entries.sum(&:protein),
      carbs: today_entries.sum(&:carbs),
      fat: today_entries.sum(&:fat)
    }
  end
  
  def new
    @diet_entry = DietEntry.new
  end  

  def create
    user = User.first
    @diet_entry = user.diet_entries.build(diet_entry_params)

    if @diet_entry.save
      redirect_to diet_entries_path, notice: "Diet entry logged!"
    else
      render :new
    end
  end

  def edit
    # @diet_entry is set by before_action
  end

  def update
    if @diet_entry.update(diet_entry_params)
      redirect_to diet_entries_path, notice: "Diet entry updated!"
    else
      render :edit
    end
  end

  private

  def set_diet_entry
    @diet_entry = DietEntry.find(params[:id])
  end

  def diet_entry_params
    params.require(:diet_entry).permit(:meal_type, :description, :calories, :protein, :carbs, :fat, :consumed_at)
  end
end
