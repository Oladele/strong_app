class UpdateDataInExercises < ActiveRecord::Migration
  def up
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

  def down
  	add_column :exercises, :dfactor_body_up
	add_column :exercises, :dfactor_body_down
	add_column :exercises, :dfactor_body_lat
	add_column :exercises, :dfactor_body_static_tension_max
	add_column :exercises, :dfactor_body_static_tension_min
	add_column :exercises, :wfactor_body_up
	add_column :exercises, :wfactor_body_down
	add_column :exercises, :wfactor_body_lat
	add_column :exercises, :wfactor_body_static_tension_max
	add_column :exercises, :wfactor_body_static_tension_min
  end
end
