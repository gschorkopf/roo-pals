class AddColumnScheduleCountToShows < ActiveRecord::Migration
  def up
    add_column :shows, :schedules_count, :integer, null: false, default: 0

    Show.all.each do |show|
      Show.reset_counters(show.id, :schedule_shows)
    end
  end

  def down
    remove_column :shows, :schedules_count
  end
end
