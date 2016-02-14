class ChangeStartAndEndTimeTypes < ActiveRecord::Migration
  def up
    change_column :reservations, :start_time, :text
    change_column :reservations, :end_time, :text
  end

  def down
    change_column :reservations, :start_time, :integer
    change_column :reservations, :end_time, :integer
  end
end
