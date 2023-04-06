class RemoveDistanceFromDeadlines < ActiveRecord::Migration[7.0]
  def change
    remove_column :deadlines, :distance, :string
  end
end
