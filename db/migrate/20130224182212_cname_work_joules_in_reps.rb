class CnameWorkJoulesInReps < ActiveRecord::Migration

   def up
  	remove_column 	:reps, :work_joules
  	add_column 		:reps, :work_joule, :float
  end

  def down
  	add_column 		:reps, :work_joules, :float
  	remove_column 	:reps, :work_joule
  end

end
