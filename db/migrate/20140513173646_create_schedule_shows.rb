class CreateScheduleShows < ActiveRecord::Migration
  def change
    create_table :schedule_shows do |t|
      t.integer :schedule_id
      t.integer :show_id
    end
  end
end
