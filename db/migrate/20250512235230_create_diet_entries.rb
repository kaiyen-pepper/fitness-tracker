class CreateDietEntries < ActiveRecord::Migration[8.0]
  def change
    create_table :diet_entries do |t|
      t.references :user, null: false, foreign_key: true
      t.string :meal_type
      t.text :description
      t.integer :calories
      t.integer :protein
      t.integer :carbs
      t.integer :fat
      t.datetime :consumed_at

      t.timestamps
    end
  end
end
