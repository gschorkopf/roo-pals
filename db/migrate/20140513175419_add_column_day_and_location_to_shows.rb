class AddColumnDayAndLocationToShows < ActiveRecord::Migration
  def change
    add_column :shows, :day, :string
    add_column :shows, :location, :string
  end
end
