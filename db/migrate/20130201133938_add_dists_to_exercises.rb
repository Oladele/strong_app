class AddDistsToExercises < ActiveRecord::Migration
  def change
    add_column :exercises, :dfactor_body_up, :float
    add_column :exercises, :dfactor_body_down, :float
    add_column :exercises, :dfactor_body_lat, :float
    add_column :exercises, :dfactor_body_static_tension_max, :float
    add_column :exercises, :dfactor_body_static_tension_min, :float
  end
end
