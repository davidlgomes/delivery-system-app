class RemoveTargetFromDeadlines < ActiveRecord::Migration[7.0]
  def change
    remove_column :deadlines, :target, :string
  end
end
