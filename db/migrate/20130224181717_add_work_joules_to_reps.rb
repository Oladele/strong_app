class AddWorkJoulesToReps < ActiveRecord::Migration
  def change
  	add_column :reps, :work_joules, :float
  end
end
