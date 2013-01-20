class AddIndexToExerciseCatName < ActiveRecord::Migration
  def change
  	  	add_index :exercise_categories, :name, unique: true
  end
end
