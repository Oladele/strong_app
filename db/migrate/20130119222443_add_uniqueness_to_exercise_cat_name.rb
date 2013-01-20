class AddUniquenessToExerciseCatName < ActiveRecord::Migration
  def up
  	    remove_index :exercise_categories, :name
  end

  def down
  	    add_index :exercise_categories, :name
  end
end
