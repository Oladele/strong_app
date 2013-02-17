class RemoveColumnsFromExercises < ActiveRecord::Migration
  def up
    remove_column :exercises, :dist_up
    remove_column :exercises, :dist_down
    remove_column :exercises, :dist_lat
    remove_column :exercises, :dist_static_tension_max
    remove_column :exercises, :dist_static_tension_min
  end

  def down
    add_column :exercises, :dist_down, :string
    add_column :exercises, :dist_up, :string
    add_column :exercises, :dist_lat
    add_column :exercises, :dist_static_tension_max
    add_column :exercises, :dist_static_tension_min
  end
end
