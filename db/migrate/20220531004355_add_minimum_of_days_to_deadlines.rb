class AddMinimumOfDaysToDeadlines < ActiveRecord::Migration[7.0]
  def change
    add_column :deadlines, :minimum_of_days, :integer
  end
end
