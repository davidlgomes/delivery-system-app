class AddMaximumDistanceToDeadline < ActiveRecord::Migration[7.0]
  def change
    add_column :deadlines, :maximum_distance, :float
  end
end
