class AddExerciseNameToReps < ActiveRecord::Migration
  def change
    add_column :reps, :exercise_name, :string
  end
end
