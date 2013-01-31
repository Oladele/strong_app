class ChangeCategoryIdNameinExercises < ActiveRecord::Migration
  def change
  	rename_column :exercises, :category_id, :exercise_category_id
  end
end
