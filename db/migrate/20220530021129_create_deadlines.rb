class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.string :originating
      t.string :target
      t.float :distance
      t.integer :days_delivery

      t.timestamps
    end
  end
end
