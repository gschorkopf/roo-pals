class AddIndexesToMultipleTables < ActiveRecord::Migration
  def change
    add_index :shows, :day
    add_index :shows, :location
    add_index :schedule_shows, :schedule_id
    add_index :schedule_shows, :show_id
  end
end
