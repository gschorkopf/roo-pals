class AddColumnFestivalIdToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :festival_id, :integer
  end
end
