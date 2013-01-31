class CreateExercises < ActiveRecord::Migration
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :category_id
      t.string :movement
      t.float :rep_distance

      t.timestamps
    end
    add_index :exercises, :name, unique: true
  end
end
