class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.belongs_to :user, index: true
      t.belongs_to :room, index: true
      t.integer :start_time
      t.integer :end_time

      t.timestamps null: false
    end
  end
end
