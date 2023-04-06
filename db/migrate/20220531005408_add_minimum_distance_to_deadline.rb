class AddMinimumDistanceToDeadline < ActiveRecord::Migration[7.0]
  def change
    add_column :deadlines, :minimum_distance, :float
  end
end
