class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :workouts, :weigh_in, :my_weight_kg
  end
end
