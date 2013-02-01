class AddWfactorsBodyToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :wfactor_body_up, :float
    add_column :exercises, :wfactor_body_down, :float
    add_column :exercises, :wfactor_body_lat, :float
    add_column :exercises, :wfactor_body_static_tension_max, :float
    add_column :exercises, :wfactor_body_static_tension_min, :float
  end
end
