class CreateExerciseCategories < ActiveRecord::Migration
  def change
    create_table :exercise_categories do |t|
      t.string :name

      t.timestamps
    end
    add_index :exercise_categories, :name
  end
end
