class RemoveOriginatingFromDeadlines < ActiveRecord::Migration[7.0]
  def change
    remove_column :deadlines, :originating, :string
  end
end
