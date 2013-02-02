class CreateReps < ActiveRecord::Migration
  def change
    create_table :reps do |t|
      t.integer :workout_id
      t.integer :exercise_id
      t.float :weight_additional_kg, default: 0
      t.string :notes

      t.timestamps
    end
    add_index :reps, [:workout_id, :created_at]
  end
end
