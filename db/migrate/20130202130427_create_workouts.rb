class CreateWorkouts < ActiveRecord::Migration
  def change
    create_table :workouts do |t|
      t.integer :user_id
      t.time :date
      t.integer :duration
      t.float :weigh_in
      t.string :notes

      t.timestamps
    end
    add_index :workouts, [:user_id, :created_at]
  end
end
