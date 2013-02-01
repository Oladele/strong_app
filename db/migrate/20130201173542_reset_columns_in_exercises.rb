class ResetColumnsInExercises < ActiveRecord::Migration
  def up
  	add_column :exercises, :dfactor_body_up, :float, default: 0
	add_column :exercises, :dfactor_body_down, :float, default: 0
	add_column :exercises, :dfactor_body_lat, :float, default: 0
	add_column :exercises, :dfactor_body_static_tension_max, :float, default: 0
	add_column :exercises, :dfactor_body_static_tension_min, :float, default: 0
	add_column :exercises, :wfactor_body_up, :float, default: 0
	add_column :exercises, :wfactor_body_down, :float, default: 0
	add_column :exercises, :wfactor_body_lat, :float, default: 0
	add_column :exercises, :wfactor_body_static_tension_max, :float, default: 0
	add_column :exercises, :wfactor_body_static_tension_min, :float, default: 0
  end

  def down
  	remove_column :exercises, :dfactor_body_up
	remove_column :exercises, :dfactor_body_down
	remove_column :exercises, :dfactor_body_lat
	remove_column :exercises, :dfactor_body_static_tension_max
	remove_column :exercises, :dfactor_body_static_tension_min
	remove_column :exercises, :wfactor_body_up
	remove_column :exercises, :wfactor_body_down
	remove_column :exercises, :wfactor_body_lat
	remove_column :exercises, :wfactor_body_static_tension_max
	remove_column :exercises, :wfactor_body_static_tension_min
  end
end
