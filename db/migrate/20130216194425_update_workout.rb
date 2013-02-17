class UpdateWorkout < ActiveRecord::Migration

   def up
  	remove_column 	:workouts, :date
  	add_column 		:workouts, :date, :datetime
  end

  def down
  	add_column 		:workouts, :date, :time
  	remove_column 	:workouts, :date, :datetime
  end

end
